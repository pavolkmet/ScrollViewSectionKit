//
//  Extractable.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

protocol Extractable: View {
    
    // MARK: - Associatedtypes
    
    associatedtype Content: View
    associatedtype ViewsContent: View
    
    // MARK: - Properties - Public

    var content: () -> Content { get }
    var views: (_VariadicView.Children) -> ViewsContent { get }

    // MARK: - Initialization - Public
    
    init(_ content: Content, @ViewBuilder views: @escaping (_VariadicView.Children) -> ViewsContent)
    init(@ViewBuilder _ content: @escaping () -> Content, @ViewBuilder views: @escaping (_VariadicView.Children) -> ViewsContent)
    
}
