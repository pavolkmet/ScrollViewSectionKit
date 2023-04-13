//
//  Color+ScrollViewSectionKit.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

#if canImport(UIKit)

extension Color {
    
    @available(iOS, introduced: 13.0, deprecated: 15.0, message: "Use .init(uiColor: UIColor) directly.")
    init(_ uiColor: UIKit.UIColor) {
        if #available(iOS 15.0, *) {
            self.init(uiColor: uiColor)
        } else {
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            var alpha: CGFloat = 0.0
            
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            self.init(
                red: Double(red),
                green: Double(green),
                blue: Double(blue),
                opacity: Double(alpha)
            )
        }
    }
    
}

#endif
