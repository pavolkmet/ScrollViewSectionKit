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
    
    var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return .edges(.horizontal, 20.0)
    }
    
    var rowSeparatorColor: Color? {
        return .black
    }
    
    @ViewBuilder
    public func makeHeaderBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.footnote)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4.0)
                .padding(.horizontal, 8.0)
                .background {
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .shadow(color: .black.opacity(0.2), radius: 4.0)
        }
        .frame(maxWidth: .infinity, minHeight: 20.0, alignment: .center)
        .background {
            GeometryReader { proxy in
                let height = proxy.frame(in: .named("SCROLL_VIEW_HEADER_TITLE")).height
                Color.white
                    .clipShape(RoundedCornersShape(cornerRadius: 12.0, corners: [.topLeft, .topRight]))
                    .padding(.top, height * 0.5)
            }
        }
        .coordinateSpace(name: "SCROLL_VIEW_HEADER_TITLE")
    }
    
    @ViewBuilder
    public func makeContentBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10.0)
            .padding(.horizontal, 20.0)
    }
    
    @ViewBuilder
    public func makeFooterBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.footnote)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8.0)
                .padding(.horizontal, 8.0)
                .background {
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .shadow(color: .black.opacity(0.2), radius: 4.0)
        }
        .frame(maxWidth: .infinity, minHeight: 20.0, alignment: .center)
        .background {
            GeometryReader { proxy in
                let height = proxy.frame(in: .named("SCROLL_VIEW_FOOTER_TITLE")).height - 10.0
                Color.white
                    .clipShape(RoundedCornersShape(cornerRadius: 12.0, corners: [.bottomLeft, .bottomRight]))
                    .padding(.bottom, height * 0.5)
            }
        }
        .coordinateSpace(name: "SCROLL_VIEW_FOOTER_TITLE")
    }
    
    
}
