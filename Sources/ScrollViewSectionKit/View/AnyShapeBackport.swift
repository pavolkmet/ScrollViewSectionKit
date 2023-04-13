//
//  AnyShapeBackport.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

public struct AnyShapeBackport: Shape {
    
    // MARK: - Properties - Private
    
    private var base: (CGRect) -> Path
    
    // MARK: - Initialization - Public
    
    @available(iOS, introduced: 13.0, deprecated: 16.0, message: "Use AnyShape.init(_ shape: Shape) directly.")
    public init<S: Shape>(_ shape: S) {
        base = shape.path(in:)
    }
    
    // MARK: - Shape
    
    public func path(in rect: CGRect) -> Path {
        base(rect)
    }
    
}
