//
//  View+ext.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

extension View {
	
	func navigate<Destination>(to destination: Destination) -> some View  where Destination: View {
		NavigationLink(destination: destination) {
			self
		}
	}
	
	func scrollable(_ axis: Axis.Set = .vertical, showIndicator: Bool = false) -> some View {
		ScrollView(axis, showsIndicators: showIndicator) {
			self
		}
	}
	
}
