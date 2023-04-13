//
//  ScrollViewRowContextMenuViewTraitKey.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ScrollViewRowContextMenuViewTraitKey: _ViewTraitKey {
    
    // MARK: - Properties - Public
    
    static var defaultValue: (() -> AnyView)? = nil
    
}

// MARK: - Extension - View - Public

public extension View {
    
    func scrollViewRowContextMenu(@ViewBuilder _ value: @escaping () -> some View) -> some View {
        _trait(ScrollViewRowContextMenuViewTraitKey.self, {
            AnyView(value())
        })
    }
    
}
