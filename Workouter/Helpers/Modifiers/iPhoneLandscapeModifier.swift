//
//  iPhoneLandscapeModifier.swift.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

extension View {
	
	///SwiftUI automatically assigns a one collumn navigation to iPads and large iPhones when running in landscape. While this is a desired behaviour on iPads, I don't like this behaviour when using an iPhone. This modifier sets the StackNavigationViewStyle on given NavigationView only for iPhones a leaves the default CollumnNavigationViewStyle on iPads
	
	@ViewBuilder
	func iPhoneLandscapeNavigationModifier() -> some View {
		if UIDevice.current.userInterfaceIdiom == .phone {
			self.navigationViewStyle(.stack)
		} else {
			self
		}
	}
	
}
