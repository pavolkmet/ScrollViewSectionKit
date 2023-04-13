//
//  GroupedScrollViewSectionStyle.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

public struct GroupedScrollViewSectionStyle: ScrollViewSectionStyle {
    
    // MARK: - IScrollViewSectionStyle
    
    public var sectionClipShape: AnyShapeBackport {
        return AnyShapeBackport(Rectangle())
    }
    
    public var rowContentInsets: ScrollViewSectionPaddingType {
        return .edges(.horizontal, 20.0)
    }
    
    public var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return .edges(.leading, 20.0)
    }
    
    @ViewBuilder
    public func makeHeaderBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0.0) {
            configuration.label
                .font(Font.system(size: 13.0, weight: .regular))
                .foregroundColor(Color.secondary)
                .padding(.top, 10.0)
                .padding(.bottom, 8.0)
                .padding(.horizontal, 20.0)
            Divider()
        }
    }
    
    @ViewBuilder
    public func makeContentBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10.0)
            .padding(.horizontal, 0.0)
    }
    
    @ViewBuilder
    public func makeFooterBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Divider()
            configuration.label
                .font(Font.system(size: 13.0, weight: .regular))
                .foregroundColor(Color.secondary)
                .padding(.top, 10.0)
                .padding(.bottom, 0.0)
                .padding(.horizontal, 20.0)
        }
    }
    
}

// MARK: - Extension - ScrollViewSectionStyle - Public

public extension ScrollViewSectionStyle where Self == GroupedScrollViewSectionStyle {
    
    static var grouped: GroupedScrollViewSectionStyle {
        return GroupedScrollViewSectionStyle()
    }
    
}
