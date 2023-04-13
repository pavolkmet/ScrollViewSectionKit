//
//  ScrollViewSectionBackgroundColorEnvironmentKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewSectionBackgroundColorEnvironmentKey: EnvironmentKey {
    
    // MARK: - Properties - Public
    
#if canImport(UIKit)
    
    static var defaultValue: Color = Color(UIColor.systemGroupedBackground)
    
#else
    
    static var defaultValue: Color = Color.white
    
#endif
    
}

// MARK: - Extension - EnvironmentValues - Public

public extension EnvironmentValues {
    
    var scrollViewSectionBackgroundColor: Color {
        get {
            self[ScrollViewSectionBackgroundColorEnvironmentKey.self]
        }
        set {
            self[ScrollViewSectionBackgroundColorEnvironmentKey.self] = newValue
        }
    }
    
}

// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewSectionBackgroundColor(_ value: Color) -> some View {
        environment(\.scrollViewSectionBackgroundColor, value)
    }
    
}
