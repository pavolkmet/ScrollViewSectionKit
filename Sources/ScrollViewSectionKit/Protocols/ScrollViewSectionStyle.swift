//
//  ScrollViewSectionStyle.swift
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

/// The `ScrollViewSectionStyle` protocol defines the appearance and layout of a section in a scroll view.
/// By conforming to this protocol, you can customize the appearance of your scroll views and make them fit your app's design.
public protocol ScrollViewSectionStyle {
    
    // MARK: - Associatedtypes - Public
    
    /// The type of view that will be used for the section's header.
    associatedtype HeaderBody: View
    /// The type of view that will be used for the section's content.
    associatedtype ContentBody: View
    ///  The type of view that will be used for the section's footer.
    associatedtype FooterBody: View
    
    // MARK: - Typealiases - Public
    
    /// A configuration object that contains information about the section's layout and appearance.
    typealias Configuration = ScrollViewSectionStyleConfiguration
    
    // MARK: - Computed Properties - Public
    
    /// A shape that defines the section's clipping mask.
    var sectionClipShape: AnyShapeBackport { get }
    
    /// The insets that will be applied to the section's content rows.
    var rowContentInsets: ScrollViewSectionPaddingType { get }
    
    /// The insets that will be applied to the section's row separators.
    var rowSeparatorInsets: ScrollViewSectionPaddingType { get }
    
    /// The color that will be applied to the section's row separators.
    var rowSeparatorColor: Color? { get }
    
    // MARK: - Helper Methods - Public
    
    @ViewBuilder
    /// Creates the view for the section header.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section header.
    func makeHeaderBody(configuration: Self.Configuration) -> Self.HeaderBody
    
    @ViewBuilder
    /// Creates the view for the section content.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section content.
    func makeContentBody(configuration: Self.Configuration) -> Self.ContentBody
    
    @ViewBuilder
    /// Creates the view for the section footer.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section footer.
    func makeFooterBody(configuration: Self.Configuration) -> Self.FooterBody
    
}

/// The `ScrollViewSectionStyleConfiguration` struct is used to hold information about the layout and appearance of a section in a scroll view.
/// By using this struct, you can customize the appearance of your scroll views and make them fit your app's design.
public struct ScrollViewSectionStyleConfiguration {
    
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
    public let label: ScrollViewSectionStyleConfiguration.Label
    
}
