//
//  Exercise.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation

enum StorageType {
	case remote, local
}

protocol ExerciseProtocol {
	var id: UUID { get }
	var name: String { get }
	var duration: Int { get }
	var createdAt: Date { get }
	var storage: StorageType { get }
}

//MARK: - Convenience typealis for array of exercises
typealias Exercises = [ExerciseProtocol]

//MARK: - Exercise model
struct Exercise {
	var id: UUID
	var name: String
	var duration: Int
	var createdAt: Date
	var userID: String?
}

extension Exercise: Codable { }
extension Exercise: Identifiable { }

extension Exercise: ExerciseProtocol {
	var storage: StorageType {
		return .remote
	}
}

extension Exercise {
	static let mockData: [Exercise] = [
		Exercise(id: UUID(), name: "Exercise 1", duration: 3600, createdAt: Date(), userID: ""),
		Exercise(id: UUID(), name: "Exercise 2", duration: 3600, createdAt: Date(), userID: ""),
		Exercise(id: UUID(), name: "Exercise 3", duration: 3600, createdAt: Date(), userID: ""),
		Exercise(id: UUID(), name: "Exercise 4", duration: 3600, createdAt: Date(), userID: "")
	]
}
