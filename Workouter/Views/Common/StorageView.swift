//
//  StorageView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct StorageLabel: View {
	let storage: StorageType
	
	private var icon: SFSymbol {
		switch storage {
		case .remote:
			return .remoteStorage
		case .local:
			return .localStorage
		}
	}
	
	private var color: Color {
		switch storage {
		case .remote:
			return .mint
		case .local:
			return .indigo
		}
	}
	
	var body: some View {
		Label {
			Text(storage.rawValue.capitalized)
				.foregroundColor(color)
				.fontWeight(.semibold)
		} icon: {
			Image(symbol: icon)
				.symbolRenderingMode(.hierarchical)
				.foregroundColor(color)
		}

	}
}

struct StorageView: View {
	
	let storage: StorageType
	
	var body: some View {
		VerticalGroup(title: "Storage") {
			StorageLabel(storage: storage)
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
