//
//  InsetGroupedView.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 15/04/2023.
//

import ScrollViewSectionKit
import SwiftUI

struct InsetGroupedView: View {
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    ForEach(0..<10, id: \.self) { index in
                        Button {
                            debugPrint("Pressed button at index", index)
                        } label: {
                            HStack(spacing: 10.0) {
                                /// Image
                                if index % 2 == 0 {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20.0, height: 20.0)
                                }
                                /// Title
                                Text("Row at index \(index)")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .buttonStyle(.scrollViewRow)
                        .scrollViewRowSeparatorInsets({
                            if index % 2 == 0 {
                                return EdgeInsets(top: 0.0, leading: 20.0 + 20.0 + 10.0, bottom: 0.0, trailing: 0.0)
                            } else {
                                return nil
                            }
                        }())
                        .scrollViewRowContextMenu {
                            Button {
                                debugPrint("Pressed context menu button at index", index)
                            } label: {
                                Label("Star", systemImage: "star")
                            }
                            Button {
                                debugPrint("Pressed context menu button at index", index)
                            } label: {
                                Label("Profile", systemImage: "person")
                            }
                            Divider()
                            Button(role: .destructive) {
                                debugPrint("Pressed context menu button at index", index)
                            } label: {
                                Label("Block", systemImage: "hand.raised")
                            }
                        }
                    }
                } header: {
                    Text("Inset Grouped section header".uppercased())
                } footer: {
                    Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
                }
                .scrollViewSectionStyle(.insetGrouped)
            }
        }
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
        .navigationTitle("Inset Grouped")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

// MARK: - PreviewProvider

struct InsetGroupedView_Previews: PreviewProvider {
    
    static var previews: some View {
        InsetGroupedView()
    }
    
}
