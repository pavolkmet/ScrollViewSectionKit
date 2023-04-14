//
//  RoundedCornersShape.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 14/04/2023.
//

import UIKit
import SwiftUI

struct RoundedCornersShape: Shape {

    // MARK: - Properties - Private
    
    private let cornerRadius: CGFloat
    private let corners: UIRectCorner
    
    // MARK: - Initialization - Public
    
    init(cornerRadius: CGFloat = 20.0, corners: UIRectCorner = UIRectCorner.allCorners) {
        self.cornerRadius = cornerRadius
        self.corners = corners
    }
    
    // MARK: - Shape

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
    
}
