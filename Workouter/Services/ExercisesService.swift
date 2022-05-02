//
//  ExercisesService.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Resolver

final class ExercisesService: ObservableObject {
	@Injected var db: Firestore
	@Injected var authenticationService: AuthenticationService
	
	@Published public var exercises: Exercises = []
	
	private var userId: String = "unknown"
	private var listenerRegistration: ListenerRegistration?
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		authenticationService.$user
			.compactMap { user in
				user?.uid
			}
			.assign(to: \.userId, on: self)
			.store(in: &cancellables)
		
		authenticationService.$user
			.receive(on: DispatchQueue.main)
			.sink { [weak self] user in
				if self?.listenerRegistration != nil {
					self?.unsubscribe()
					self?.subscribe()
				}
			}
			.store(in: &cancellables)
	}
	
	deinit {
		unsubscribe()
	}
	
	func unsubscribe() {
		if listenerRegistration != nil {
			listenerRegistration?.remove()
			listenerRegistration = nil
		}
	}
	
	func subscribe() {
		
		if listenerRegistration != nil {
			unsubscribe()
		}
		
		let query = db.collection("exercises")
			.whereField("userID", isEqualTo: userId)
			.order(by: "createdAt", descending: true)
		
		listenerRegistration = query
			.addSnapshotListener { [weak self] (querySnapshot, error) in
				
				guard let documents = querySnapshot?.documents else {
					debugPrint("No documents in collection")
					return
				}
				
				self?.exercises = documents.compactMap { queryDocumentSnapshot in
					let result = Result { try queryDocumentSnapshot.data(as: Exercise.self) }
					
					switch result {
					case .success(let reminder):
						return reminder
					case .failure(let error):
						debugPrint(error.localizedDescription)
						return nil
					}
				}
			}
	}
	
	func saveExercise(_ exercise: Exercise) {
		do {
			var newExercise = exercise
			newExercise.userID = userId
			let _ = try db.collection("exercises").addDocument(from: newExercise)
		}
		catch {
			debugPrint(error.localizedDescription)
		}
	}
}
