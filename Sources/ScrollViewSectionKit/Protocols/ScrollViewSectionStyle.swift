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
    
    /// The type of view that will be used for the section's content.
    associatedtype ContentBody: View
    /// The type of view that will be used for the section's header.
    associatedtype HeaderBody: View
    /// The type of view that will be used for the section's rows.
    associatedtype RowsBody: View
    /// The type of view that will be used for the section's row.
    associatedtype RowBody: View
    ///  The type of view that will be used for the section's footer.
    associatedtype FooterBody: View
    
    // MARK: - Typealiases - Public
    
    /// A configuration object that contains information about the section's layout and appearance.
    typealias ContentConfiguration = ScrollViewSectionStyleContentConfiguration
    /// A configuration object that contains information about the section's header and appearance.
    typealias HeaderConfiguration = ScrollViewSectionStyleHeaderConfiguration
    /// A configuration object that contains information about the section's rows and appearance.
    typealias RowsConfiguration = ScrollViewSectionStyleRowsConfiguration
    /// A configuration object that contains information about the section's row and appearance.
    typealias RowConfiguration = ScrollViewSectionStyleRowConfiguration
    /// A configuration object that contains information about the section's footer and appearance.
    typealias FooterConfiguration = ScrollViewSectionStyleFooterConfiguration
    
    // MARK: - Computed Properties - Public
    
    /// The insets that will be applied to the section's content rows.
    var rowContentInsets: ScrollViewSectionPaddingType { get }
    
    /// The background color that will be applied to the section's row.
    var rowBackgroundColor: Color? { get }
    
    /// The insets that will be applied to the section's row separators.
    var rowSeparatorInsets: ScrollViewSectionPaddingType { get }
    
    /// The color that will be applied to the section's row separators.
    var rowSeparatorColor: Color? { get }
    
    // MARK: - Helper Methods - Public
    
    @ViewBuilder
    /// Creates the view for the section content.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section content.
    func makeContentBody(configuration: Self.ContentConfiguration) -> Self.ContentBody
    
    @ViewBuilder
    /// Creates the view for the section header.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section header.
    func makeHeaderBody(configuration: Self.HeaderConfiguration) -> Self.HeaderBody
    
    @ViewBuilder
    /// Creates the view for the section rows.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section rows.
    func makeRowsBody(configuration: Self.RowsConfiguration) -> Self.RowsBody
    
    @ViewBuilder
    /// Creates the view for the section row.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section row.
    func makeRowBody(configuration: Self.RowConfiguration) -> Self.RowBody
    
    @ViewBuilder
    /// Creates the view for the section footer.
    /// - Parameter configuration: The configuration object used to access data about the section.
    /// - Returns: The view for the section footer.
    func makeFooterBody(configuration: Self.FooterConfiguration) -> Self.FooterBody
    
}
