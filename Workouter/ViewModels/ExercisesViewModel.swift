//
//  ExercisesViewModel.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Combine
import SwiftUI
import Resolver

final class ExercisesViewModel: ObservableObject {
	@Published private(set) var remoteRepository: ExercisesService
	@Published private(set) var localRepository: CoreDataManager
	
	@Published var allExercises: Exercises
	
	@Published var remoteExercises: Exercises
	
	@Published var localExercises: Exercises
	
	@Published private(set) var showingSuccessIndication = false
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		self.allExercises = []
		self.remoteExercises = []
		self.localExercises = []
		
		remoteRepository = Resolver.resolve()
		localRepository = Resolver.resolve()
		
		remoteRepository.subscribe()
		
		bindData()
	}
	
}

//MARK: - Public methods
extension ExercisesViewModel {
	func createNewExercise(name: String, location: String, duration: Int, storage: StorageType) {
		switch storage {
		case .remote:
			createNewRemoteExercise(name: name, location: location, duration: duration)
		case .local:
			createNewLocalRepository(name: name, location: location, duration: duration)
		}
	}
}


//MARK: - Private methods
private extension ExercisesViewModel {
	
	func bindData() {
		remoteRepository.$exercises
			.map { exercises in
				exercises.sorted { lhs, rhs in
					lhs.createdAt > rhs.createdAt
				}
			}
			.assign(to: &$remoteExercises)
		
		localRepository.$localExercises
			.map { exercises in
				exercises.sorted { lhs, rhs in
					lhs.createdAt > rhs.createdAt
				}
			}
			.assign(to: &$localExercises)
		
		$remoteExercises
			.sink { [weak self] exercises in
				self?.appendAllExercisesWithRemoteExercises(exercises)
			}
			.store(in: &cancellables)
		
		$localExercises
			.sink { [weak self] exercises in
				self?.appendAllExercisesWithLocalExercises(exercises)
			}
			.store(in: &cancellables)
	}
	
	func appendAllExercisesWithRemoteExercises(_ incomingExercises: Exercises) {
		var filtered = allExercises.filter { exercise in
			exercise.storage == .local
		}
		
		filtered.append(contentsOf: incomingExercises)
		
		allExercises = filtered.sorted(by: { lhs, rhs in
			lhs.createdAt > rhs.createdAt
		})
	}
	
	func appendAllExercisesWithLocalExercises(_ incomingExercises: Exercises) {
		var filtered = allExercises.filter { exercise in
			exercise.storage == .remote
		}
		
		filtered.append(contentsOf: incomingExercises)
		
		allExercises = filtered.sorted(by: { lhs, rhs in
			lhs.createdAt > rhs.createdAt
		})
	}
	
	func createNewRemoteExercise(name: String, location: String, duration: Int) {
		let newExercise = RemoteExercise(id: UUID(), name: name, location: location, duration: duration, createdAt: Date())
		remoteRepository.saveExercise(newExercise)
		
		showSuccessIndication()
	}
	
	func createNewLocalRepository(name: String, location: String,duration: Int) {
		localRepository.saveData(name: name, location: location, duration: duration)
		
		showSuccessIndication()
	}
	
	func showSuccessIndication() {
		showingSuccessIndication = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			self?.showingSuccessIndication = false
		}
	}
}
