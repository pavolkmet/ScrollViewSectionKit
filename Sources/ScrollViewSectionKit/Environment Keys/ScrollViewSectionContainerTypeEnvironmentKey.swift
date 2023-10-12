//
//  ScrollViewSectionContainerTypeEnvironmentKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 12/10/2023.
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

struct ScrollViewSectionContainerTypeEnvironmentKey: EnvironmentKey {
    
    // MARK: - Properties - Public
    
    static var defaultValue: ScrollViewSectionContainerType = .VStack
    
}

// MARK: - Extension - EnvironmentValues - Public

public extension EnvironmentValues {
    
    var scrollViewSectionContainerType: ScrollViewSectionContainerType {
        get {
            self[ScrollViewSectionContainerTypeEnvironmentKey.self]
        }
        set {
            self[ScrollViewSectionContainerTypeEnvironmentKey.self] = newValue
        }
    }
    
}

// MARK: - Extension - View - Public

public extension View {
    
    
    /// Sets the container type for a current section
    /// - Parameter type: The container type to apply to the section.
    /// - Returns: A view with the specified container type applied to the section.
    ///
    /// Use this function to customize the performance of a section in a scroll view by changing its container type.
    func scrollViewSectionContainerType(_ type: ScrollViewSectionContainerType) -> some View {
        environment(\.scrollViewSectionContainerType, type)
    }
    
}
