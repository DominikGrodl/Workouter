//
//  ExercisesAdaptableList.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

///ExercisesAdaptableList uses horizontalSizeClass to determine whether to show a one or a two column layout. The horizontalSizeClass is regular on iPads and Pro iPhones and compact on smaller devices. This ensures that two columns are shown only when there is enough space

struct ExercisesAdaptableList: View {
	
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass
	
	@Binding var exercises: Exercises
	
	private var showGrid: Bool {
		horizontalSizeClass == .regular
	}
	
	private let twoColumns = [GridItem(.flexible()), GridItem(.flexible())]
	private let oneColumn = [GridItem(.flexible())]
	
	var body: some View {
		if exercises.isEmpty {
			HStack {
				Spacer()
				EmptyStateView()
				Spacer()
			}
			.padding(.top, 40)
		} else {
			LazyVGrid(columns: showGrid ? twoColumns : oneColumn) {
				ForEach(exercises, id: \.id, content: ExerciseCapsuleView.init)
			}
			.animation(.easeIn, value: showGrid)
		}
	}
	
}

struct ExercisesAdaptableList_Previews: PreviewProvider {
	static var previews: some View {
		ExercisesAdaptableList(exercises: .constant(RemoteExercise.mockData))
	}
}
