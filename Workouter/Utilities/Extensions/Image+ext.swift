//
//  Image+ext.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

enum SFSymbol: String {
	case xmarkCircleFill = "xmark.circle.fill"
	case remoteStorage = "externaldrive.badge.icloud"
	case localStorage = "externaldrive"
	case plus = "plus"
	case walkingFigure = "figure.walk"
	case emptyFolder = "folder.badge.questionmark"
	case checkmark = "checkmark"
}

extension Image {
	
	///Initializer to initialize an Image from SFSymbol enum. If this initialization fails with 'No symbol named [...] found in system symbol set', then there is a typo in the SFSymbol enum
	init(symbol: SFSymbol) {
		self.init(systemName: symbol.rawValue)
	}
}
