//
//  View+ext.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

extension View {
	
	///mainBackgroundStyle() -> some View sets the backgroud of the view to .secondarySystemBackground
	func mainBackgroundStyle() -> some View {
		self.background(Color.secondarySystemBackground)
	}
	
	///secondaryBackgroundStyle() -> some View sets the backgroud of the view to .tertiarySystemBackground
	func secondaryBackgroundStyle() -> some View {
		self.background(Color.tertiarySystemBackground)
	}
	
	///navigate<Destination>(to destination: Destination) -> some View  where Destination: View wraps view inside a NavigationLink and navigates to a given view when tapped. This is a convenience function to get rid of some of the nesting inside larger views
	func navigate<Destination>(to destination: Destination) -> some View  where Destination: View {
		NavigationLink(destination: destination) {
			self
		}
	}
	
	///scrollable(_ axis: Axis.Set = .vertical, showIndicator: Bool = false) -> some View wraps view inside a ScrollView. Default values for ScrollView are vertical scrolling without indicator. This is a convenience function to get rid of some of the nesting inside larger views
	func scrollable(_ axis: Axis.Set = .vertical, showIndicator: Bool = false) -> some View {
		ScrollView(axis, showsIndicators: showIndicator) {
			self
		}
	}
	
}
