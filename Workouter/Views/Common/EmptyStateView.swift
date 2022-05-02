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
				.font(.system(size: 100, weight: .bold, design: .rounded))
				.foregroundColor(.secondaryLabel)
				.padding(.bottom)
			
			Text("You have no exercises saved in this location. Add some, they will apear here once you do.")
				.font(.title3)
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
