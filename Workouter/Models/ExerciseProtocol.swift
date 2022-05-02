//
//  ExerciseProtocol.swift
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
