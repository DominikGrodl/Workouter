//
//  String+ext.swift
//  Workouter
//
//  Created by Dominik Grodl on 03.05.2022.
//

import Foundation

extension String {
	func truncated(after count: Int) -> String {
		guard self.count > count else { return self }
		let truncateAfter = index(startIndex, offsetBy: count)
		guard endIndex > truncateAfter else { return self }
		return String(self[startIndex..<truncateAfter]) + "…"
	}
}
