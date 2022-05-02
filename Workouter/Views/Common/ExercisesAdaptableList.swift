//
//  ExercisesAdaptableList.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ExercisesAdaptableList: View {
	
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass
	
	@Binding var exercises: Exercises
	
	private var showGrid: Bool {
		horizontalSizeClass == .regular
	}
	
	private let twoColumns = [GridItem(.flexible()), GridItem(.flexible())]
	private let oneColumn = [GridItem(.flexible())]
	
	var body: some View {
		LazyVGrid(columns: showGrid ? twoColumns : oneColumn) {
			ForEach(exercises, id: \.id, content: ExerciseCapsuleView.init)
		}
		.animation(.default, value: showGrid)
	}
	
}

struct ExercisesAdaptableList_Previews: PreviewProvider {
	static var previews: some View {
		ExercisesAdaptableList(exercises: .constant(RemoteExercise.mockData))
	}
}
