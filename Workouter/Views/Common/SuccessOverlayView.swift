//
//  SuccessOverlayView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct SuccessOverlayView: View {
    var body: some View {
		Image(symbol: .checkmark)
			.font(.system(size: 64).bold())
			.padding(68)
			.foregroundColor(.secondaryLabel)
			.background(.ultraThinMaterial)
			.cornerRadius(24)
    }
}

struct SuccessOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessOverlayView()
    }
}
