//
//  ScrollViewRowSeparatorInsetsViewTraitKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewRowSeparatorInsetsViewTraitKey: _ViewTraitKey {
    
    // MARK: - Properties - Public
    
    static var defaultValue: EdgeInsets? = nil
    
}

// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewRowSeparatorInsets(_ value: EdgeInsets?) -> some View {
        _trait(ScrollViewRowSeparatorInsetsViewTraitKey.self, value)
    }
    
}
