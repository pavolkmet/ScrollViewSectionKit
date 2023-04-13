//
//  ScrollViewSectionPaddingType.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//

import SwiftUI

public enum ScrollViewSectionPaddingType {
    
    case edgeInsets(EdgeInsets)
    case edges(Edge.Set, CGFloat?)
    
}
