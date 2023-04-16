//
//  Color+ScrollViewSectionKit.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//
//  MIT License
//
//  Copyright (c) 2023 Pavol Kmet
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

#if canImport(UIKit)

extension Color {
    
    @available(iOS, introduced: 14.0, deprecated: 15.0, message: "Use .init(uiColor: UIColor) directly.")
    @available(watchOS, introduced: 7.0, deprecated: 8.0, message: "Use .init(uiColor: UIColor) directly.")
    @available(tvOS, introduced: 14.0, deprecated: 15.0, message: "Use .init(uiColor: UIColor) directly.")
    init(_ uiColor: UIKit.UIColor) {
        if #available(iOS 15.0, watchOS 8.0, tvOS 15.0, *) {
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
