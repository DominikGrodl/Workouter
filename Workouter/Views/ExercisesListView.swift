//
//  ExercisesListView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ExercisesListView: View {
	@EnvironmentObject var viewModel: ExercisesViewModel
	
	@State var showLocal = false
	
	@State var number = 0
	
    var body: some View {
		NavigationView {
			
			VStack {
				Toggle(isOn: $showLocal) {
					Text("Show local")
				}
				
				ForEach(showLocal ? viewModel.localExercises : viewModel.remoteExercises, id: \.id) { item in
					ExerciseCapsuleView(exercise: item)
				}
			}
			.scrollable()
			.toolbar(content: {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button("Add") {
						viewModel.createNewExercise(name: "New \(number)", duration: 200, storage: showLocal ? .local : .remote)
						number += 1
					}
				}
			})
			.navigationTitle("Workouter")
		}
    }
}

struct ExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesListView()
    }
}
