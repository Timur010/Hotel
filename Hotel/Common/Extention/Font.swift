//
//  Font.swift
//  Hotel
//
//  Created by Timur Kadiev on 20.12.2023.
//

import SwiftUI

extension Font {
    static func regular(size: CGFloat) -> Font {
        Font.custom("SF-Pro-Display-Regular", size: size)
    }
    static func bold(size: CGFloat) -> Font {
        Font.custom("SFProDisplaBold", size: size)
    }
    static func light(size: CGFloat) -> Font {
        Font.custom("SF-Pro-Display-Light", size: size)
    }
    static func medium(size: CGFloat) -> Font {
        Font.custom("SF-Pro-Display-Medium", size: size)
    }
    static func semiBold(size: CGFloat) -> Font {
        Font.custom("SF-Pro-Display-Semibold", size: size)
    }
}
