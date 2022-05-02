//
//  StorageView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct StorageView: View {
	
	let storage: StorageType
	
	var icon: SFSymbol {
		switch storage {
		case .remote:
			return .remoteStorage
		case .local:
			return .localStorage
		}
	}
	
	var color: Color {
		switch storage {
		case .remote:
			return .mint
		case .local:
			return .indigo
		}
	}
	
	var title: String {
		switch storage {
		case .remote:
			return "Cloud"
		case .local:
			return "Local"
		}
	}
	
	var body: some View {
		VerticalGroup(title: "Storage") {
			HStack {
				Image(symbol: icon)
					.symbolRenderingMode(.hierarchical)
					.foregroundColor(color)
				
				Text(title)
					.foregroundColor(color)
					.fontWeight(.semibold)
			}
		}
	}
}

struct StorageView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			StorageView(storage: .local)
				.previewLayout(PreviewLayout.sizeThatFits)
				.padding()
				.previewDisplayName("Local light")
			
			StorageView(storage: .local)
				.previewLayout(PreviewLayout.sizeThatFits)
				.padding()
				.environment(\.colorScheme, .dark)
				.background(Color.black)
				.previewDisplayName("Local dark")
			
			StorageView(storage: .remote)
				.previewLayout(PreviewLayout.sizeThatFits)
				.padding()
				.previewDisplayName("Remote light")
			
			StorageView(storage: .remote)
				.previewLayout(PreviewLayout.sizeThatFits)
				.padding()
				.environment(\.colorScheme, .dark)
				.background(Color.black)
				.previewDisplayName("Remote dark")
		}
	}
}
