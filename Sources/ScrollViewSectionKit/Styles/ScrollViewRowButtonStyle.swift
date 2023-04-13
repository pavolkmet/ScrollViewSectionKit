//
//  ScrollViewRowButtonStyle.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
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
