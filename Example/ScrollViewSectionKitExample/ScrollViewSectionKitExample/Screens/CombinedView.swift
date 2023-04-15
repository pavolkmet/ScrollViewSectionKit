//
//  CombinedView.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 15/04/2023.
//

import ScrollViewSectionKit
import SwiftUI

struct CombinedView: View {
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            sectionPlain
            sectionGrouped
            sectionInsetGrouped
            sectionCustom
        }
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
        .navigationTitle("Combined")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Computed Properties - Public
    
    @ViewBuilder
    private var sectionPlain: some View {
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
                .scrollViewRowBackgroundColor({
                    if index % 2 != 0 {
                        return Color.blue.opacity(0.2)
                    } else {
                        return Color.white
                    }
                }())
            }
        } header: {
            Text("Plain section header".uppercased())
        } footer: {
            Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
        }
        .scrollViewSectionStyle(.plain)
    }
    
    @ViewBuilder
    private var sectionGrouped: some View {
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
                .scrollViewRowBackgroundColor({
                    if index % 2 != 0 {
                        return Color.blue.opacity(0.2)
                    } else {
                        return Color.white
                    }
                }())
            }
        } header: {
            Text("Grouped section header".uppercased())
        } footer: {
            Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
        }
        .scrollViewSectionStyle(.grouped)

    }
    
    @ViewBuilder
    private var sectionInsetGrouped: some View {
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
                .scrollViewRowBackgroundColor({
                    if index % 2 != 0 {
                        return Color.blue.opacity(0.2)
                    } else {
                        return Color.white
                    }
                }())
            }
        } header: {
            Text("Inset Grouped section header".uppercased())
        } footer: {
            Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
        }
        .scrollViewSectionStyle(.insetGrouped)

    }
    
    @ViewBuilder
    private var sectionCustom: some View {
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
                .scrollViewRowBackgroundColor({
                    if index % 2 != 0 {
                        return Color.blue.opacity(0.2)
                    } else {
                        return Color.white
                    }
                }())
            }
        } header: {
            Text("Custom section header")
        } footer: {
            Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
        }
        .scrollViewSectionStyle(CustomScrollViewSectionStyle())
    }
    
}

// MARK: - PreviewProvider

struct CombinedView_Previews: PreviewProvider {
    
    static var previews: some View {
        CombinedView()
    }
    
}
