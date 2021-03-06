//
//  Exercise.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation

struct RemoteExercise {
	var id: UUID
	var name: String
	var location: String
	var duration: Int
	var createdAt: Date
	var userID: String?
}

extension RemoteExercise: Codable { }

extension RemoteExercise: ExerciseProtocol {
	var storage: StorageType {
		return .remote
	}
}

extension RemoteExercise {
	static let mockData: Exercises = [
		RemoteExercise(id: UUID(), name: "Exercise 1", location: "Location", duration: 3600, createdAt: Date(), userID: ""),
		RemoteExercise(id: UUID(), name: "Exercise 2", location: "Location", duration: 3600, createdAt: Date(), userID: ""),
		RemoteExercise(id: UUID(), name: "Exercise 3", location: "Location", duration: 3600, createdAt: Date(), userID: ""),
		RemoteExercise(id: UUID(), name: "Exercise 4", location: "Location", duration: 3600, createdAt: Date(), userID: "")
	]
}
