//
//  ScrollViewRowBackgroundColorViewTraitKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewRowBackgroundColorViewTraitKey: _ViewTraitKey {
    
    // MARK: - Properties - Public
    
#if canImport(UIKit)
    
    static var defaultValue: Color = Color(UIColor.secondarySystemGroupedBackground)
    
#else
    
    static var defaultValue: Color = Color.secondary
    
#endif
    
}


// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewRowBackgroundColor(_ value: Color) -> some View {
        _trait(ScrollViewRowBackgroundColorViewTraitKey.self, value)
    }
    
}
