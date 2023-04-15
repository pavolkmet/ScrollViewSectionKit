//
//  AnyShapeBackport.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
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

/// A type-erased `Shape` that wraps another `Shape` value.
public struct AnyShapeBackport: Shape {
    
    // MARK: - Properties - Private
    
    /// The underlying `Shape` instance.
    private var base: (CGRect) -> Path
    
    // MARK: - Initialization - Public
    
    /// Creates a type-erased `Shape` instance that wraps the provided `Shape`.
    /// - Parameter shape: The `Shape` to wrap.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "Use AnyShape.init(_ shape: Shape) directly.")
    public init<S: Shape>(_ shape: S) {
        base = shape.path(in:)
    }
    
    // MARK: - Shape
    
    /// Returns a `Path` representing the shape of the `AnyShapeBackport`.
    /// - Parameter rect: The bounding rectangle of the shape.
    public func path(in rect: CGRect) -> Path {
        base(rect)
    }
    
}
