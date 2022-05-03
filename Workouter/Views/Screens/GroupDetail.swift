//
//  GroupDetail.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct GroupDetail: View {
	let title: String
	@State var groupItems: Exercises
	
    var body: some View {
		ExercisesAdaptableList(exercises: $groupItems)
			.padding()
			.scrollable()
			.mainBackgroundStyle()
			.navigationTitle(title.capitalized)
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct GroupDetail_Previews: PreviewProvider {
    static var previews: some View {
		GroupDetail(title: "Test title", groupItems: RemoteExercise.mockData)
    }
}
