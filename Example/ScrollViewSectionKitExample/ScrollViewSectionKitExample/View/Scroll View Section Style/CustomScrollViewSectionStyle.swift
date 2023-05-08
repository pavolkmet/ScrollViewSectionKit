//
//  CustomScrollViewSectionStyle.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 14/04/2023.
//

import ScrollViewSectionKit
import SwiftUI

struct CustomScrollViewSectionStyle: ScrollViewSectionStyle {
    
    // MARK: - IScrollViewSectionStyle
    
    var sectionClipShape: AnyShapeBackport {
        return AnyShapeBackport(Rectangle())
    }
    
    var rowContentInsets: ScrollViewSectionPaddingType {
        return .edges(.horizontal, 20.0)
    }
    
    var rowBackgroundColor: Color? {
        return .black.opacity(0.85)
    }
    
    var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return .edges(.horizontal, 20.0)
    }
    
    var rowSeparatorColor: Color? {
        return .white.opacity(0.5)
    }
    
    @ViewBuilder
    public func makeHeaderBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.footnote.weight(.medium))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4.0)
                .padding(.horizontal, 8.0)
                .background {
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .shadow(color: Color.black.opacity(0.2), radius: 4.0)
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
        }
        .frame(maxWidth: .infinity, minHeight: 10.0, alignment: .center)
        .background {
            GeometryReader { proxy in
                let height = proxy.frame(in: .named("SCROLL_VIEW_HEADER_TITLE")).height
                Color.black.opacity(0.85)
                    .clipShape(RoundedCorners(
                        corners: [
                            .topLeft(12.0),
                            .topRight(12.0)
                        ]
                    ))
                    .padding(.top, height > 10.0 ? height * 0.5 : 0.0)
            }
        }
        .coordinateSpace(name: "SCROLL_VIEW_HEADER_TITLE")
    }
    
    @ViewBuilder
    public func makeContentBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding(.vertical, 10.0)
            .padding(.horizontal, 20.0)
    }
    
    @ViewBuilder
    public func makeFooterBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.footnote.weight(.medium))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8.0)
                .padding(.horizontal, 8.0)
                .background {
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .shadow(color: Color.black.opacity(0.2), radius: 4.0)
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
        }
        .frame(maxWidth: .infinity, minHeight: 10.0, alignment: .center)
        .background {
            GeometryReader { proxy in
                let height = proxy.frame(in: .named("SCROLL_VIEW_FOOTER_TITLE")).height
                Color.black.opacity(0.85)
                    .clipShape(RoundedCorners(
                        corners: [
                            .bottomLeft(12.0),
                            .bottomRight(12.0)
                        ]
                    ))
                    .padding(.bottom, height > 10.0 ? height * 0.5 : 0.0)
            }
        }
        .coordinateSpace(name: "SCROLL_VIEW_FOOTER_TITLE")
    }
    
    
}
