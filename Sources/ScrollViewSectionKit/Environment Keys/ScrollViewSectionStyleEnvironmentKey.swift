//
//  ScrollViewSectionStyleEnvironmentKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewSectionStyleEnvironmentKey: EnvironmentKey {

    // MARK: - Properties - Public

    static var defaultValue: AnyScrollViewSectionStyle = AnyScrollViewSectionStyle(style: .insetGrouped)

}

// MARK: - Extension - EnvironmentValues - Public

public extension EnvironmentValues {
    
    var scrollViewSectionStyle: AnyScrollViewSectionStyle {
        get {
            self[ScrollViewSectionStyleEnvironmentKey.self]
        }
        set {
            self[ScrollViewSectionStyleEnvironmentKey.self] = newValue
        }
    }
    
}

// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewSectionStyle(_ value: any ScrollViewSectionStyle) -> some View {
        environment(\.scrollViewSectionStyle, AnyScrollViewSectionStyle(style: value))
    }
    
}
