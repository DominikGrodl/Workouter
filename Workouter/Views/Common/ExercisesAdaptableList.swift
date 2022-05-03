//
//  ExercisesAdaptableList.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

///ExercisesAdaptableList uses horizontalSizeClass to determine whether to show a one or a two column layout. The horizontalSizeClass is regular on iPads and Pro iPhones and compact on smaller devices. This ensures that two columns are shown only when there is enough space

//Clarification after the sumbission- this view uses @Binding for exercises array even though it does not change the array. This is due to the fact that sometimes, when using simple @State, the variable misses a @Published property update in the ViewModel. In my experience, it happened once in ≈ 10 updates. I tried to get to the issue, but I believe it is a problem with SwiftUI. Therefore, as the issue is not present when using @Binding, I chose this solution over different, more complicated ones.

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
