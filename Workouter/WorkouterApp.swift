//
//  WorkouterApp.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI
import Firebase

@main
struct WorkouterApp: App {
	
	init() {
		UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
		
		FirebaseApp.configure()
	}
	
	@StateObject var exercisesViewModel = ExercisesViewModel()
	@StateObject var coreDataManager = CoreDataManager()
	
    var body: some Scene {
        WindowGroup {
			ContentView()
				.environmentObject(exercisesViewModel)
				.environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
