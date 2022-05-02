//
//  CoreDataManager.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import CoreData

final class CoreDataManager: ObservableObject {
	let container = NSPersistentContainer(name: "LocalExercise")
	
	@Published var localExercises: [LocalExercise] = []
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				debugPrint("Core data failed to load with error \(error.localizedDescription)")
			}
		}
		
		fetchLocalExercises()
		addObserver()
	}
	
	deinit {
		removeObserver()
	}
	
	private func addObserver() {
		NotificationCenter
			.default
			.addObserver(forName: .NSManagedObjectContextDidSave,
											   object: container.viewContext,
											   queue: .main) { [weak self] _ in
			self?.fetchLocalExercises()
		}
	}
	
	func saveData(name: String, duration: Int) {
		container.viewContext.perform {
			do {
				let exercise = LocalExercise(context: self.container.viewContext)
				exercise.entityNameString = name
				exercise.entityDuration = Int64(duration)
				exercise.entityCreatedAt = Date()
				exercise.entityId = UUID()
				
				try self.container.viewContext.save()
			} catch {
				debugPrint(error.localizedDescription)
			}
		}
	}
	
	private func removeObserver() {
		NotificationCenter.default.removeObserver(self)
	}
	
	private func fetchLocalExercises() {
		let fetchRequest: NSFetchRequest<LocalExercise> = LocalExercise.fetchRequest()
		
		container.viewContext.perform {
			do {
				let result = try fetchRequest.execute()
				self.localExercises = result
				
			} catch {
				print("Unable to Execute Fetch Request, \(error.localizedDescription)")
			}
		}
	}
}
