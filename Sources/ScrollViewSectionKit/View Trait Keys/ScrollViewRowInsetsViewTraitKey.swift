//
//  ScrollViewRowInsetsViewTraitKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
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

struct ScrollViewRowInsetsViewTraitKey: _ViewTraitKey {

    // MARK: - Properties - Public

    static var defaultValue: EdgeInsets? = nil

}

// MARK: - Extension - View - Public

public extension View {
    
     /// Sets the edge insets for a current row.
     /// - Parameter insets: The edge insets to use for the row. The `insets` parameter is an optional `EdgeInsets` object that specifies the amount of padding to apply to the row content. If the parameter is `nil`, the default edge insets will be used.
     /// - Returns: A `View` object with the row edge insets set.
     ///
     /// Use this function to adjust the edge insets of a row in a scroll view. The edge insets control the spacing between the row content and the edges of the row.
    func scrollViewRowInsets(_ insets: EdgeInsets?) -> some View {
        _trait(ScrollViewRowInsetsViewTraitKey.self, insets)
    }
    
}
