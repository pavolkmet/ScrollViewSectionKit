//
//  ScrollViewRowContextMenuViewTraitKey.swift
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

struct ScrollViewRowContextMenuViewTraitKey: _ViewTraitKey {
    
    // MARK: - Properties - Public
    
    static var defaultValue: (() -> AnyView)? = nil
    
}

// MARK: - Extension - View - Public

public extension View {
    
    /// Sets the context menu for a current row.
    /// - Parameter menuItems: A closure that returns a view representing the context menu. The `menuItems` parameter is a closure that returns a view representing the context menu. You can use the `ViewBuilder` attribute to create a menu with multiple items.
    /// - Returns: A `View` object with the row context menu set.
    ///
    /// Use this function to add a context menu to a row in a scroll view. The context menu is a popup menu that appears when the user performs a long press or right-click on the row.
    func scrollViewRowContextMenu(@ViewBuilder _ menuItems: @escaping () -> some View) -> some View {
        _trait(ScrollViewRowContextMenuViewTraitKey.self, {
            AnyView(menuItems())
        })
    }
    
}
