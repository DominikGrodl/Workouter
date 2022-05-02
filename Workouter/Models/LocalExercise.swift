//
//  LocalExercise.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import CoreData

extension LocalExercise: ExerciseProtocol {
	public var id: UUID {
		entityId ?? UUID()
	}
	
	var name: String {
		entityNameString ?? "Unknown"
	}
	
	var duration: Int {
		Int(entityDuration)
	}
	
	var createdAt: Date {
		entityCreatedAt ?? Date()
	}
	
	var storage: StorageType {
		return .local
	}
}
