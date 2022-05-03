//
//  ExerciseCapsuleView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

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
