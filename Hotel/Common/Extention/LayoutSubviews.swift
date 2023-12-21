//
//  LayoutSubviews.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI

extension [LayoutSubviews.Element] {
    func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
        return self.compactMap { view in
            return view.sizeThatFits(proposal).height
        }.max() ?? 0
    }
}
