//
//  ExtractMulti.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 14/04/2023.
//

import SwiftUI

struct ExtractMulti<Content: View, ViewsContent: View>: Extractable {
    
    // MARK: - Properties - Public
    
    let content: () -> Content
    let views: (_VariadicView.Children) -> ViewsContent
    
    // MARK: - Initialization - Public

    init(_ content: Content, @ViewBuilder views: @escaping (_VariadicView.Children) -> ViewsContent) {
        self.content = { content }
        self.views = views
    }

    init(@ViewBuilder _ content: @escaping () -> Content, @ViewBuilder views: @escaping (_VariadicView.Children) -> ViewsContent) {
        self.content = content
        self.views = views
    }
    
    // MARK: - View

    var body: some View {
        _VariadicView.Tree(
            MultiViewRoot(views: views),
            content: content
        )
    }
    
}

fileprivate struct MultiViewRoot<Content: View>: _VariadicView_MultiViewRoot {
    
    // MARK: - Properties - Public
    
    let views: (_VariadicView.Children) -> Content

    // MARK: - _VariadicView_MultiViewRoot
    
    func body(children: _VariadicView.Children) -> some View {
        views(children)
    }
    
}
