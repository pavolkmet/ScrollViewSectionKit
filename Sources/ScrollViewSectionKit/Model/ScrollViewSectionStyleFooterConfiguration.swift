//
//
//  ScrollViewSectionStyleFooterConfiguration.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 19/07/2023.
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

/// The `ScrollViewSectionStyleFooterConfiguration` struct is used to hold information about the layout and appearance of a section footer in a scroll view.
public struct ScrollViewSectionStyleFooterConfiguration {
    
    // MARK: - Label - Public
    
    public struct Label: View {
        
        // MARK: - Properties - Private
        
        /// The content of the label.
        public var body: AnyView
        
        // MARK: - Initialization - Public
        
        /// Initializes a new instance of the `Label` struct with the given content.
        /// - Parameter content: The content of the label.
        init<Content: View>(content: Content) {
            body = AnyView(content)
        }
        
    }
    
    // MARK: - Properties - Public
    
    /// The label for the section.
    public let label: ScrollViewSectionStyleFooterConfiguration.Label
    
}
