//
//  EmptyStateView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
		VStack {
			Image(symbol: .emptyFolder)
				.font(.system(size: 100, weight: .regular, design: .rounded))
				.foregroundColor(.secondaryLabel)
			
			Text("No exercises here")
				.font(.title)
				.fontWeight(.semibold)
				.foregroundColor(.secondaryLabel)
				.lineLimit(0)
				.multilineTextAlignment(.center)
				.padding(.top)
		}
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
