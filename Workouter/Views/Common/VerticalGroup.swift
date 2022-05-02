//
//  VerticalGroup.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

struct VerticalGroup<Content: View>: View {
	
	enum TitleSize {
		case regular, large
	}
	
	private let title: String
	private let size: TitleSize
	@ViewBuilder private let content: Content
	
	init(title: String, titleSize: TitleSize = .regular, @ViewBuilder content: () -> Content) {
		self.title = title
		self.size = titleSize
		self.content = content()
	}
	
	private var font: Font {
		size == .regular ? .headline : .title3.bold()
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(font)
				.foregroundColor(Color(.label))
			
			content
		}
	}
}

struct VerticalGroup_Previews: PreviewProvider {
	static var previews: some View {
		VerticalGroup(title: "Hello", titleSize: .large) {
			Text("Hello")
		}
	}
}
