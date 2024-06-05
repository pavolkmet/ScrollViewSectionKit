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
public struct AnyShapeBackport: InsettableShape, @unchecked Sendable {
    
    // MARK: - Properties - Private
    
    /// The underlying `Shape` instance.
    private var base: (CGRect) -> Path
    
    /// The amount by which to inset the shape.
    private var inset: CGFloat
    
    // MARK: - Initialization - Public
    
    /// Creates a type-erased `Shape` instance that wraps the provided `Shape`.
    /// - Parameter shape: The `Shape` to wrap.
    /// - Note: This initializer is deprecated in iOS 16.0. Use `AnyShape.init(_ shape: Shape)` directly instead.
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "Use AnyShape.init(_ shape: Shape) directly.")
    public init<S: Shape>(_ shape: S) {
        self.base = shape.path(in:)
        self.inset = 0.0
    }
    
    // MARK: - Shape
    
    /// Returns a `Path` representing the shape of the `AnyShapeBackport`.
    /// - Parameter rect: The bounding rectangle of the shape.
    /// - Returns: A `Path` that represents the shape within the specified rectangle.
    public func path(in rect: CGRect) -> Path {
        base(rect.insetBy(dx: inset, dy: inset))
    }
    
    // MARK: - InsettableShape
    
    /// Returns an inset version of the `AnyShapeBackport`.
    /// - Parameter amount: The amount by which to inset the shape.
    /// - Returns: An `AnyShapeBackport` that is inset by the specified amount.
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.inset += amount
        return shape
    }
}
