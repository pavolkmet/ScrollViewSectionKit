//
//  RoundedCorners.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 14/04/2023.
//

import UIKit
import SwiftUI

struct RoundedCorners: Shape {
    
    // MARK: - CornerType
    
    enum CornerType {
        
        case topLeft(CGFloat)
        case topRight(CGFloat)
        case bottomLeft(CGFloat)
        case bottomRight(CGFloat)
        
        // MARK: - Computed Properties - Private
        
        fileprivate var value: CGFloat {
            switch self {
            case .topLeft(let value), .topRight(let value), .bottomLeft(let value), .bottomRight(let value):
                return value
            }
        }
        
    }
    
    // MARK: - Properties - Private
        
    private let corners: [CornerType]
    
    // MARK: - Initialization - Public
    
    init(corners: [CornerType]) {
        self.corners = corners
    }
    
    // MARK: - Shape
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topLeft = rect.origin
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        
        /// Corner - Top Left
        if let radius = corners.first(where: { type in
            switch type {
            case .topLeft:
                return true
            default:
                return false
            }
        }), radius.value != 0.0 {
            path.move(to: CGPoint(x: topLeft.x + radius.value, y: topLeft.y))
        } else {
            path.move(to: topLeft)
        }

        /// Corner - Top Right
        if let radius = corners.first(where: { type in
            switch type {
            case .topRight:
                return true
            default:
                return false
            }
        }), radius.value != 0.0 {
            path.addLine(to: CGPoint(x: topRight.x - radius.value, y: topRight.y))
            path.addArc(tangent1End: topRight, tangent2End: CGPoint(x: topRight.x, y: topRight.y + radius.value), radius: radius.value)
        } else {
            path.addLine(to: topRight)
        }
        
        /// Corner - Bottom Right
        if let radius = corners.first(where: { type in
            switch type {
            case .bottomRight:
                return true
            default:
                return false
            }
        }), radius.value != 0.0 {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - radius.value))
            path.addArc(tangent1End: bottomRight, tangent2End: CGPoint(x: bottomRight.x - radius.value, y: bottomRight.y), radius: radius.value)
        } else {
            path.addLine(to: bottomRight)
        }

        /// Corner - Bottom Left
        if let radius = corners.first(where: { type in
            switch type {
            case .bottomLeft:
                return true
            default:
                return false
            }
        }), radius.value != 0.0 {
            path.addLine(to: CGPoint(x: bottomLeft.x + radius.value, y: bottomLeft.y))
            path.addArc(tangent1End: bottomLeft, tangent2End: CGPoint(x: bottomLeft.x, y: bottomLeft.y - radius.value), radius: radius.value)
        } else {
            path.addLine(to: bottomLeft)
        }

        /// Corner - Top Left
        if let radius = corners.first(where: { type in
            switch type {
            case .topLeft:
                return true
            default:
                return false
            }
        }), radius.value != 0.0 {
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius.value))
            path.addArc(tangent1End: topLeft, tangent2End: CGPoint(x: topLeft.x + radius.value, y: topLeft.y), radius: radius.value)
        } else {
            path.addLine(to: topLeft)
        }
        
        path.closeSubpath()
        
        return path
    }
    
}
