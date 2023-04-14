//
//  ScrollViewSection.swift
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

public struct ScrollViewSection<Content, Header, Footer>: View where Content: View, Header: View, Footer: View {
    
    // MARK: - Properties - Public
    
    @Environment(\.scrollViewSectionBackgroundColor)
    public var scrollViewSectionBackgroundColor: Color
    
    @Environment(\.scrollViewSectionStyle)
    public var scrollViewSectionStyle: AnyScrollViewSectionStyle
    
    // MARK: - Properties - Private
    
    private var content: () -> Content
    private var header: () -> Header
    private var footer: () -> Footer
    
    // MARK: - Initialization - Public
    
    public init(@ViewBuilder content: @escaping () -> Content) where Header == EmptyView, Footer == EmptyView {
        self.content = content
        self.header = {
            EmptyView()
        }
        self.footer = {
            EmptyView()
        }
    }
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header) where Footer == EmptyView {
        self.content = content
        self.header = header
        self.footer = {
            EmptyView()
        }
    }
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder footer: @escaping () -> Footer) where Header == EmptyView {
        self.content = content
        self.header = {
            EmptyView()
        }
        self.footer = footer
    }
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header, @ViewBuilder footer: @escaping () -> Footer) {
        self.content = content
        self.header = header
        self.footer = footer
    }
    
    // MARK: - View
    
    @ViewBuilder
    public var body: some View {
        /// Content
        ExtractMulti(
            content()
                .frame(maxWidth: .infinity, minHeight: 44.0, alignment: .leading)
        ) { children in
            if children.count > 0 {
                scrollViewSectionStyle.makeContentBody(configuration: .init(
                    label: .init(content: section(children: children))
                ))
                .background(scrollViewSectionBackgroundColor)
            } else {
                EmptyView()
            }
        }
    }
    
    // MARK: - Helper Methods - Private
    
    @ViewBuilder
    private func section(children: _VariadicView.Children) -> some View {
        VStack(alignment: .leading, spacing: 0.0) {
            /// Header
            scrollViewSectionStyle.makeHeaderBody(
                configuration: .init(
                    label: .init(content: header())
                )
            )
            /// Rows
            VStack(alignment: .leading, spacing: 0.0) {
                let last = children.last?.id
                ForEach(children) { child in
                    /// Row
                    if let menuItems = child[ScrollViewRowContextMenuViewTraitKey.self] {
                        row(child: child, last: last)
                            .contextMenu(menuItems: menuItems)
                    } else {
                        row(child: child, last: last)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .clipShape(scrollViewSectionStyle.sectionClipShape)
            /// Footer
            scrollViewSectionStyle.makeFooterBody(
                configuration: .init(
                    label: .init(content: footer())
                )
            )
        }
    }
    
    @ViewBuilder
    private func row(child: _VariadicView_Children.Element, last: AnyHashable?) -> some View {
        /// Row
        Group {
            /// Child
            Group {
                let type: ScrollViewSectionPaddingType = {
                    if let insets = child[ScrollViewRowInsetsViewTraitKey.self] {
                        return .edgeInsets(insets)
                    } else {
                        return scrollViewSectionStyle.rowContentInsets
                    }
                }()
                switch type {
                case .edgeInsets(let edgeInsets):
                    child
                        .padding(edgeInsets)
                case .edges(let edges, let length):
                    child
                        .padding(edges, length)
                }
            }
            /// Divider
            if child.id != last {
                Group {
                    let type: ScrollViewSectionPaddingType = {
                        if let insets = child[ScrollViewRowSeparatorInsetsViewTraitKey.self] {
                            return .edgeInsets(insets)
                        } else {
                            return scrollViewSectionStyle.rowSeparatorInsets
                        }
                    }()
                    switch type {
                    case .edgeInsets(let edgeInsets):
                        Divider()
                            .padding(edgeInsets)
                    case .edges(let edges, let length):
                        Divider()
                            .padding(edges, length)
                    }
                }
            }
        }
        .background(child[ScrollViewRowBackgroundColorViewTraitKey.self])
    }
    
}
