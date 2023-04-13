//
//  AnyScrollViewSectionStyle.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

public struct AnyScrollViewSectionStyle: ScrollViewSectionStyle {
    
    // MARK: - Properties - Private
    
    private var _sectionClipShape: AnyShapeBackport
    private var _rowContentInsets: ScrollViewSectionPaddingType
    private var _rowSeparatorInsets: ScrollViewSectionPaddingType
    private var _makeHeader: (Configuration) -> AnyView
    private var _makeContent: (Configuration) -> AnyView
    private var _makeFooter: (Configuration) -> AnyView
    
    // MARK: - Initialization - Public
    
    init(style: any ScrollViewSectionStyle) {
        self._sectionClipShape = style.sectionClipShape
        self._rowContentInsets = style.rowContentInsets
        self._rowSeparatorInsets = style.rowSeparatorInsets
        self._makeHeader = { configuration in
            AnyView(style.makeHeaderBody(configuration: configuration))
        }
        self._makeContent = { configuration in
            AnyView(style.makeContentBody(configuration: configuration))
        }
        self._makeFooter = { configuration in
            AnyView(style.makeFooterBody(configuration: configuration))
        }
    }
    
    // MARK: - IScrollViewSectionStyle
    
    public var sectionClipShape: AnyShapeBackport {
        return _sectionClipShape
    }
    
    public var rowContentInsets: ScrollViewSectionPaddingType {
        return _rowContentInsets
    }
    
    public var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return _rowSeparatorInsets
    }
    
    public func makeHeaderBody(configuration: Configuration) -> some View {
        _makeHeader(configuration)
    }
    
    public func makeContentBody(configuration: Configuration) -> some View {
        _makeContent(configuration)
    }
    
    public func makeFooterBody(configuration: Configuration) -> some View {
        _makeFooter(configuration)
    }
    
}
