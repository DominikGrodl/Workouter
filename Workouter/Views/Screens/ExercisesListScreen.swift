//
//  ExercisesListScreen.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ExercisesListScreen: View {
	
	private enum ExercisesFilter: String, CaseIterable {
		case all = "All"
		case local = "Local"
		case remote = "Remote"
	}
	
	@EnvironmentObject var viewModel: ExercisesViewModel
	
	@State private var showingAddExerciseScreen = false
	
	@State private var filter: ExercisesFilter = .all
	
	private var exercises: Binding<Exercises> {
		switch filter {
		case .all:
			return $viewModel.allExercises
		case .local:
			return $viewModel.localExercises
		case .remote:
			return $viewModel.remoteExercises
		}
	}
	
	var body: some View {
		
		VStack {
			GroupsStackView(exercises: $viewModel.allExercises)
			
			VerticalGroup(title: "\(filter.rawValue) exercises", titleSize: .large) {
				ExercisesAdaptableList(exercises: exercises)
			}
			.padding()
		}
		.scrollable()
		.overlay(content: {
			successOverlay
		})
		.toolbar(content: {
			ToolbarItem(placement: .navigationBarLeading) { addExerciseButtonItem }
			
			ToolbarItem(placement: .navigationBarTrailing) { filterToolbarItem }
		})
		.sheet(isPresented: $showingAddExerciseScreen, content: {
			AddExerciseScreen()
		})
		.mainBackgroundStyle()
		.navigationTitle("Workouter")
	}
	
	private var successOverlay: some View {
		SuccessOverlayView()
			.opacity(viewModel.showingSuccessIndication ? 1 : 0)
			.animation(.default, value: viewModel.showingSuccessIndication)
	}
	
	private var addExerciseButtonItem: some View {
		Button {
			showingAddExerciseScreen.toggle()
		} label: {
			Image(symbol: .plus)
		}
	}
	
	private var filterToolbarItem: some View {
		Menu("Showing " + filter.rawValue.lowercased()) {
			ForEach(ExercisesFilter.allCases, id: \.self) { filter in
				Button {
					self.filter = filter
				} label: {
					Text(filter.rawValue)
				}
			}
		}
	}
}

struct ExercisesListScreen_Previews: PreviewProvider {
	static var previews: some View {
		ExercisesListScreen()
	}
}
