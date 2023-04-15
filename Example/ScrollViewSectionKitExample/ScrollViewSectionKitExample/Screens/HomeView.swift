//
//  HomeView.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 15/04/2023.
//

import ScrollViewSectionKit
import SwiftUI

struct HomeView: View {
    
    // MARK: - ItemType
    
    enum ItemType: CaseIterable {
        
        case plain
        case grouped
        case insetGrouped
        case custom
        case combined
        
        // MARK: - Computed Properties - Public
        
        var title: String {
            switch self {
            case .plain:
                return "Plain"
            case .grouped:
                return "Grouped"
            case .insetGrouped:
                return "Inset Grouped"
            case .custom:
                return "Custom"
            case .combined:
                return "Combined"
            }
        }
        
        var subtitle: String {
            return "Section style"
        }
        
    }
    
    // MARK: - Properties - Private
    
    @State var items: [ItemType] = ItemType.allCases
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0.0) {
                    ScrollViewSection {
                        ForEach(items, id: \.self) { item in
                            NavigationLink {
                                switch item {
                                case .plain:
                                    PlainView()
                                case .grouped:
                                    GroupedView()
                                case .insetGrouped:
                                    InsetGroupedView()
                                case .custom:
                                    CustomView()
                                case .combined:
                                    CombinedView()
                                }
                            } label: {
                                HStack(alignment: .center, spacing: 10.0) {
                                    VStack(alignment: .leading, spacing: 2.0) {
                                        /// Title
                                        Text(item.title)
                                            .foregroundColor(.primary)
                                        /// Subtitle
                                        Text(item.subtitle)
                                            .foregroundColor(.secondary)
                                            .font(.subheadline)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    /// Disclosure Indicator
                                    DisclosureIndicator()
                                }
                                .padding(.vertical, 8.0)
                            }
                        }
                    } footer: {
                        Label("Choose one of the given styles and see how it looks.", systemImage: "info.circle.fill")
                    }
                }
            }
            .scrollViewSectionBackgroundColor(.clear)
            .scrollViewSectionStyle(.insetGrouped)
            .navigationTitle("Home")
            .background {
                Color(uiColor: UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
            }
        }
    }
    
}

// MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
    
}
