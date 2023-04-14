//
//  ScrollViewRowButtonStyle.swift
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

public struct ScrollViewRowButtonStyle: ButtonStyle {
    
    // MARK: - Properties - Public
    
    @Environment(\.redactionReasons)
    public var redactionReasons: RedactionReasons
    
    @Environment(\.isEnabled)
    public var isEnabled: Bool
    
    // MARK: - Properties - Private
    
    private let padding: Double
    private let color: Color
    private let opacity: Double
    
    // MARK: - Initialization - Public
    
    public init(padding: Double = 20.0, color: Color = .black, opacity: Double = 0.1) {
        self.padding = padding
        self.color = color
        self.opacity = opacity
    }
    
    // MARK: - ButtonStyle
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .opacity(isEnabled ? 1.0 : 0.45)
                .padding(.horizontal, padding)
            Rectangle()
                .fill(color.opacity(configuration.isPressed ? opacity : 0.0))
        }
        .contentShape(Rectangle())
        .padding(.horizontal, -padding)
        .animation(configuration.isPressed ? .none : .default, value: configuration.isPressed)
        .allowsHitTesting(redactionReasons != .placeholder)
    }
    
}

// MARK: - Extension - ScrollViewRowButtonStyle - Public

public extension ButtonStyle where Self == ScrollViewRowButtonStyle {
    
    static var scrollViewRow: ScrollViewRowButtonStyle {
        return ScrollViewRowButtonStyle()
    }
    
    static func scrollViewRow(padding: Double = 20.0, color: Color = .black, opacity: Double = 0.1) -> ScrollViewRowButtonStyle {
        return ScrollViewRowButtonStyle(padding: padding, color: color, opacity: opacity)
    }
    
}
