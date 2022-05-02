//
//  AddExerciseScreen.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct AddExerciseScreen: View {
	
	@EnvironmentObject var viewModel: ExercisesViewModel
	@Environment(\.dismiss) var dismiss
	
	@State private var workoutName = String()
	@State private var location = String()
	@State private var sinceDate: Date = Date()
	@State private var toDate: Date = Date()
	
	@State private var selectedStorage: StorageType = .local
	private let availableStorages: [StorageType] = [.local, .remote]
	
	@State private var loading = false
	
	private let generator = UINotificationFeedbackGenerator()
	
	private var isDisabled: Bool {
		return workoutName.isEmpty || location.isEmpty
	}
	
	private var timeDifference: TimeInterval {
		let interval = toDate.timeIntervalSince(sinceDate)
		if interval < 0 {
			return 0
		} else {
			return interval
		}
	}
	
	private var timeDurationString: String {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .brief
		return formatter.string(from: timeDifference) ?? "N/A"
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Workout name", text: $workoutName)
					TextField("Location", text: $location)
					DatePicker("Start", selection: $sinceDate, in: ...Date.now)
					DatePicker("End", selection: $toDate, in: sinceDate...Date.now)
					
					Picker("Save", selection: $selectedStorage) {
						ForEach(availableStorages, id: \.self) {
							Text($0.rawValue)
						}
					}
					.pickerStyle(.segmented)
					
					Text("Duration: \(timeDurationString)")
				}
				
				Button(action: putDataToDatabase) {
					Text("Save")
				}
				.disabled(isDisabled)
				
			}
			.navigationTitle("Add exercise")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						dismiss.callAsFunction()
					} label: {
						Image(symbol: .xmarkCircleFill)
							.foregroundColor(.secondary)
					}

				}
			}
		}
    }
	
	private func putDataToDatabase() {
		generator.prepare()
		viewModel.createNewExercise(name: workoutName, location: location, duration: Int(timeDifference.rounded()), storage: selectedStorage)
		generator.notificationOccurred(.success)
		dismiss.callAsFunction()
	}
}

struct AddExerciseScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseScreen()
    }
}
