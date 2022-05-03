//
//  GroupsStackView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI
import Collections

///GroupsStackView uses OrderedDictionary<String, Exercises> to keep track of insertion. Normal Dictionary in ForEach has to be accessed as 'Array<dictName.keys.enumerated()>, id: \.element', which efectivelly shuffles the array every time it is accessed. That results in the stack items changing places, which feels very weird on the usability part. Ordered dictionary keeps track of insertion and new updates push the key to front, which means that the most recent adition will alway appear first in the stack

struct GroupsStackView: View {
	
	@Binding var exercises: Exercises
	@State private var groups: OrderedDictionary<String, Exercises> = [:]
	
    var body: some View {
		HStack {
			ForEach(groups.keys, id: \.self) { key in
				GroupBubbleView(title: key)
					.navigate(to: GroupDetail(title: key, groupItems: groups[key] ?? []))
			}
		}
		.padding([.horizontal, .top])
		.scrollable(.horizontal)
		.onChange(of: exercises.count, perform: { _ in
			groupByExerciseName()
		})
    }
	
	private func groupByExerciseName() {
		groups = OrderedDictionary(grouping: exercises) { element in
			element.name.lowercased()
		}
	}
}

struct GroupsStackView_Previews: PreviewProvider {
    static var previews: some View {
		GroupsStackView(exercises: .constant(RemoteExercise.mockData))
    }
}
