//
//  Item.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 14/04/2023.
//

import Foundation

struct Item: Identifiable {
    
    // MARK: - Properties - Public
    
    let id: UUID
    let image: String?
    let title: String
    
    // MARK: - Initialization - Public
    
    init(image: String?, title: String) {
        self.id = UUID()
        self.image = image
        self.title = title
    }
    
}
