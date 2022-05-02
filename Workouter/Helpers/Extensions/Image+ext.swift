//
//  Image+ext.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

enum SFSymbol: String {
	case xmarkCircleFill = "xmark.circle.fill"
	case chevronRight = "chevron.right"
	case remoteStorage = "externaldrive.badge.icloud"
	case localStorage = "externaldrive"
	case plus = "plus"
	case walkingFigure = "figure.walk"
	case emptyFolder = "folder.badge.questionmark"
	case checkmark = "checkmark"
}

extension Image {
	init(symbol: SFSymbol) {
		self.init(systemName: symbol.rawValue)
	}
}
