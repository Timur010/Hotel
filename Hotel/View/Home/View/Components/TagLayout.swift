//
//  TagLayout.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI

struct TagLayout: Layout {
    var spacing: CGFloat = 8
    var leftPadding: CGFloat = 16
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? 0
        var height: CGFloat = 0
        let rows = generateRows(maxWidth, proposal, subviews)
        
        for (index, row) in rows.enumerated() {
            if index == (rows.count - 1) {
                height += row.maxHeight(proposal)
            } else {
                height += row.maxHeight(proposal) + spacing
            }
        }
        
        return .init(width: maxWidth, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
            var origin = bounds.origin
            origin.x += leftPadding

            let maxWidth = bounds.width - leftPadding

            let rows = generateRows(maxWidth, proposal, subviews)

            for row in rows {
                origin.x = leftPadding

                for view in row {
                    let viewSize = view.sizeThatFits(proposal)
                    view.place(at: origin, proposal: proposal)
                    
                    origin.x += (viewSize.width + spacing)
                }
                
                origin.y += (row.maxHeight(proposal) + spacing)
            }
        }
    
    func generateRows(_ maxWidth: CGFloat, _ proposal: ProposedViewSize, _ subviews: Subviews) -> [[LayoutSubviews.Element]] {
        var row: [LayoutSubviews.Element] = []
        var rows: [[LayoutSubviews.Element]] = []
        
        var origin = CGRect.zero.origin
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            
            if (origin.x + viewSize.width + spacing) > maxWidth {
                rows.append(row)
                row.removeAll()
                
                origin.x = 0
                row.append(view)
                
                origin.x += (viewSize.width + spacing)
            } else {
                row.append(view)
                
                origin.x += (viewSize.width + spacing)
            }
        }
        
        if !row.isEmpty {
            rows.append(row)
            row.removeAll()
        }
        
        return rows
    }
}
