//
//  Resolver.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import FirebaseFirestore
import Resolver

extension Resolver: ResolverRegistering {
	public static func registerAllServices() {
		register { Firestore.firestore() }.scope(.application)
		register { AuthenticationService() }.scope(.application)
		register { ExercisesService() }.scope(.application)
	}
}
