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
	@Published var repository: ExercisesService
	
	@Published var exercises: Exercises
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		self.exercises = []
		repository = Resolver.resolve()
		repository.subscribe()
		
		repository.$exercises
			.map { exercises in
				exercises.sorted { lhs, rhs in
					lhs.createdAt > rhs.createdAt
				}
			}
			.assign(to: &$exercises)
	}
	
	func createNewRemoteExercise(name: String, duration: Int) {
		let newExercise = Exercise(id: UUID(), name: name, duration: duration, createdAt: Date())
		repository.saveExercise(newExercise)
	}
	
}
