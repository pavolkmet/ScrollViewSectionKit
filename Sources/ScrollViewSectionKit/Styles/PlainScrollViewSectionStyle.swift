//
//  PlainScrollViewSectionStyle.swift
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

public struct PlainScrollViewSectionStyle: ScrollViewSectionStyle {
    
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
        configuration.label
            .font(Font.system(size: 13.0, weight: .regular))
            .foregroundColor(Color.secondary)
            .padding(.top, 10.0)
            .padding(.bottom, 8.0)
            .padding(.horizontal, 20.0)
    }
    
    @ViewBuilder
    public func makeContentBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10.0)
            .padding(.horizontal, 0.0)
    }
    
    @ViewBuilder
    public func makeFooterBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.system(size: 13.0, weight: .regular))
            .foregroundColor(Color.secondary)
            .padding(.top, 10.0)
            .padding(.bottom, 0.0)
            .padding(.horizontal, 20.0)
    }
    
}

// MARK: - Extension - ScrollViewSectionStyle - Public

public extension ScrollViewSectionStyle where Self == PlainScrollViewSectionStyle {
    
    static var plain: PlainScrollViewSectionStyle {
        return PlainScrollViewSectionStyle()
    }
    
}
