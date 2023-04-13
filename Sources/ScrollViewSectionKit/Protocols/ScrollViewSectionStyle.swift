//
//  ScrollViewSectionStyle.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

public protocol ScrollViewSectionStyle {
    
    // MARK: - Associatedtypes - Public
    
    associatedtype HeaderBody: View
    associatedtype ContentBody: View
    associatedtype FooterBody: View
    
    // MARK: - Typealiases - Public
    
    typealias Configuration = ScrollViewSectionStyleConfiguration
    
    // MARK: - Computed Properties - Public
    
    var sectionClipShape: AnyShapeBackport { get }
    
    var rowContentInsets: ScrollViewSectionPaddingType { get }
    var rowSeparatorInsets: ScrollViewSectionPaddingType { get }
    
    // MARK: - Helper Methods - Public
    
    @ViewBuilder
    func makeHeaderBody(configuration: Self.Configuration) -> Self.HeaderBody
    
    @ViewBuilder
    func makeContentBody(configuration: Self.Configuration) -> Self.ContentBody
    
    @ViewBuilder
    func makeFooterBody(configuration: Self.Configuration) -> Self.FooterBody
    
}

public struct ScrollViewSectionStyleConfiguration {
    
    // MARK: - Label - Public
    
    public struct Label: View {
        
        // MARK: - Properties - Private
        
        public var body: AnyView
        
        // MARK: - Initialization - Public
        
        init<Content: View>(content: Content) {
            body = AnyView(content)
        }
        
    }
    
    // MARK: - Properties - Public
    
    public let label: ScrollViewSectionStyleConfiguration.Label
    
}
