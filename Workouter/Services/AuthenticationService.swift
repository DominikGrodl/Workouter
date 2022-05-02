//
//  AuthenticationService.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import Foundation
import FirebaseAuth

final class AuthenticationService: ObservableObject {
	
	@Published var user: User?
	
	private var handle: AuthStateDidChangeListenerHandle?
	
	init() {
		registerStateListener()
	}
	
	func signIn() {
		if Auth.auth().currentUser == nil {
			Auth.auth().signInAnonymously()
		}
	}
	
	func signOut() {
		do {
			try Auth.auth().signOut()
		}
		catch {
			debugPrint("error when trying to sign out: \(error.localizedDescription)")
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
