//
//  ExerciseCapsuleView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

///ExerciseCapsuleView takes an object conforming to ExerciseProtocol and dispays it in a view. The name + location properties are added to be displyed in the header. The lineLimit of the header title is set to 2 with truncationMode = .middle to ensure that both start of the activity name and the place are visible

struct ExerciseCapsuleView: View {
	
	@State var exercise: ExerciseProtocol
	
	private var timeDurationString: String {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .abbreviated
		let interval = TimeInterval(exercise.duration)
		return formatter.string(from: interval) ?? "N/A"
	}
	
	private var dateString: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		return formatter.string(from: exercise.createdAt)
	}
	
	var body: some View {
		
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				
				Label(title: {
					Text("\(exercise.name.capitalized), \(exercise.location.capitalized)")
						.lineLimit(2)
						.truncationMode(.middle)
				}, icon: {
					Image(symbol: .walkingFigure)
				})
				.font(.footnote)
				.foregroundColor(.accentColor)
				
				Spacer()
				
				Text(dateString)
					.font(.footnote)
					.foregroundColor(.secondaryLabel)
				
			}
			
			HStack(spacing: 18) {
				
				VerticalGroup(title: "Duration" ) {
					Text(timeDurationString)
						.fontWeight(.semibold)
				}
				
				Divider()
				
				StorageView(storage: exercise.storage)
			}
		}
		.padding()
		.secondaryBackgroundStyle()
		.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseCapsuleView(exercise: RemoteExercise.mockData.first!)
			.preferredColorScheme(.dark)
			.padding()
	}
}
