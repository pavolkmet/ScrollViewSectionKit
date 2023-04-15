//
//  DisclosureIndicator.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 15/04/2023.
//

import SwiftUI

struct DisclosureIndicator: View {
    
    // MARK: - Body
    
    var body: some View {
        Image(systemName: "chevron.right")
            .font(Font.system(size: 13.5, weight: .bold))
            .foregroundColor(Color(uiColor: UITableView().separatorColor ?? UIColor.gray.withAlphaComponent(0.3)))
    }
    
}

// MARK: - PreviewProvider

struct DisclosureIndicator_Previews: PreviewProvider {
    
    static var previews: some View {
        DisclosureIndicator()
    }
    
}
