//
//  ExerciseCapsuleView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct ExerciseCapsuleView: View {
	
	@State var exercise: ExerciseProtocol
	
	var body: some View {
		HStack(alignment: .top) {
			
			VStack(alignment: .leading) {
				
				Label(title: {
					Text(exercise.name.capitalized)
				}, icon: {
					Image(symbol: .walkingFigure)
				})
				.font(.footnote)
				.foregroundColor(.accentColor)
				
				HStack(spacing: 18) {
					
					VerticalGroup(title: exercise.name) {
						HStack {
							Text("\(exercise.duration)")
								.font(.title3)
								.fontWeight(.bold)
							
							Text("min")
								.fontWeight(.bold)
								.foregroundColor(.secondaryLabel)
						}
					}
					
					Divider()
					
					StorageView(storage: exercise.storage)
				}
				
				
			}
			
			Spacer()
			
			Text(String(describing: exercise.createdAt))
				.font(.footnote)
				.foregroundColor(.secondaryLabel)
		}
		.padding()
		.background(Color.secondarySystemBackground)
		.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
		.navigate(to: Text(exercise.name))
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseCapsuleView(exercise: RemoteExercise.mockData.first!)
			.preferredColorScheme(.dark)
			.padding()
	}
}
