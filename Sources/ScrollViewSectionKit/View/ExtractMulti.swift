//
//  ExtractMulti.swift
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
