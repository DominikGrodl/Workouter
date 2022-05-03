//
//  GroupBubbleView.swift
//  Workouter
//
//  Created by Dominik Grodl on 02.05.2022.
//

import SwiftUI

///Group bubble uses the truncated(after...) function to show only certain number of letter. Because it is used in a context of a scrollable HStack, it would just keep showing even very long strings with efectivelly no limit. The truncated(after...) ensures maximum number of characters

struct GroupBubbleView: View {
	let title: String
	
    var body: some View {
		Text(title.capitalized.truncated(after: 20))
			.padding(.vertical, 6)
			.padding(.horizontal, 10)
			.secondaryBackgroundStyle()
			.clipShape(Capsule())
			.hoverEffect(.lift)
    }
}

struct GroupBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBubbleView(title: "Title")
    }
}
