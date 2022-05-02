//
//  ExercisesListView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ExercisesListView: View {
	@EnvironmentObject var viewModel: ExercisesViewModel
	
    var body: some View {
		NavigationView {
			List(viewModel.exercises, id: \.id) { item in
				Text(item.name)
			}
			.navigationTitle("Workouter")
		}
    }
}

struct ExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesListView()
    }
}
