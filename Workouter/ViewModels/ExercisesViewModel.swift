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
	@Published var remoteRepository: ExercisesService
	@Published var localRepository: CoreDataManager
	
	@Published var allExercises: Exercises
	
	@Published var remoteExercises: Exercises
	
	@Published var localExercises: Exercises
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		self.allExercises = []
		self.remoteExercises = []
		self.localExercises = []
		remoteRepository = Resolver.resolve()
		localRepository = Resolver.resolve()
		
		remoteRepository.subscribe()
		
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
		
//		Publishers.MergeMany($remoteExercises, $localExercises)
//			.assign(to: &$allExercises)
		
//		$remoteExercises
//			.sink { [weak self] exercises in
//
//				self?.allExercises.removeAll(where: { exercise in
//					exercise.storage == .remote
//				})
//
//				self?.allExercises.append(contentsOf: exercises)
//			}
//			.store(in: &cancellables)
//
//		$localExercises
//			.sink { [weak self] exercises in
//
//				self?.allExercises.removeAll(where: { exercise in
//					exercise.storage == .local
//				})
//
//				self?.allExercises.append(contentsOf: exercises)
//			}
//			.store(in: &cancellables)
	}
	
	func createNewExercise(name: String, duration: Int, storage: StorageType) {
		switch storage {
		case .remote:
			createNewRemoteExercise(name: name, duration: duration)
		case .local:
			createNewLocalRepository(name: name, duration: duration)
		}
	}
	
	private func constructAllExercises() {
		let exercises = remoteExercises + localExercises
		allExercises = exercises.sorted(by: { lhs, rhs in
			lhs.createdAt > rhs.createdAt
		})
	}
	
	private func createNewRemoteExercise(name: String, duration: Int) {
		let newExercise = RemoteExercise(id: UUID(), name: name, duration: duration, createdAt: Date())
		remoteRepository.saveExercise(newExercise)
	}
	
	private func createNewLocalRepository(name: String, duration: Int) {
		localRepository.saveData(name: name, duration: duration)
	}
	
}
