//
//  ContentView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView {
			ExercisesListScreen()
		}
		.iPhoneLandscapeNavigationModifier()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
