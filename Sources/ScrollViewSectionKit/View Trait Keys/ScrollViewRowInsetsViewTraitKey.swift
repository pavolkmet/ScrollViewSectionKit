//
//  ScrollViewRowInsetsViewTraitKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewRowInsetsViewTraitKey: _ViewTraitKey {

    // MARK: - Properties - Public

    static var defaultValue: EdgeInsets? = nil

}

// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewRowInsets(_ value: EdgeInsets?) -> some View {
        _trait(ScrollViewRowInsetsViewTraitKey.self, value)
    }
    
}
