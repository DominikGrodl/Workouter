//
//  AuthenticationService.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import FirebaseAuth

final class AuthenticationService: ObservableObject {
	
	@Published private(set) var user: User?
	
	private var handle: AuthStateDidChangeListenerHandle?
	
	init() {
		registerStateListener()
	}
	
	func signIn() {
		if Auth.auth().currentUser == nil {
			Auth.auth().signInAnonymously()
		}
	}
	
	private func registerStateListener() {
		if handle == nil {
			handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
				self.user = user
				
				if let user = user {
					debugPrint("User signed in with id \(user.uid)")
				}
				else {
					debugPrint("User signed out.")
					self.signIn()
				}
			})
		}
	}
}
