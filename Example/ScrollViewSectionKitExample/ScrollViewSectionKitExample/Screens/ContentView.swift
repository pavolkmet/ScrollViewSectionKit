//
//  ContentView.swift
//  ScrollViewSectionKitExample
//
//  Created by Pavol Kmet on 14/04/2023.
//

import ScrollViewSectionKit
import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties - Private
    
    @State private var items: [Item]
    
    // MARK: - Initialization - Public
    
    init() {
        self._items = State<[Item]>(
            initialValue: (0..<10).map({ index in
                return Item(
                    image: index % 2 == 0 ? "person.fill" : nil,
                    title: "Row \(index)"
                )
            })
        )
    }
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                sectionInsetGrouped
                sectionCustom
                sectionGrouped
                sectionPlain
            }
        }
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
    // MARK: - Computed Properties - Private
    
    @ViewBuilder
    private var sectionInsetGrouped: some View {
        ScrollViewSection {
            ForEach(items) { item in
                Button {
                    debugPrint("Pressed button at index", index)
                } label: {
                    HStack(spacing: 10.0) {
                        /// Image
                        if let image = item.image {
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20.0, height: 20.0)
                        }
                        /// Title
                        Text(item.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.scrollViewRow)
                .scrollViewRowSeparatorInsets({
                    if let _ = item.image {
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
            Text("Inset Grouped section header style".uppercased())
        } footer: {
            Text("Inset Grouped section footer style")
        }
        .scrollViewSectionStyle(.insetGrouped)
    }
    
    @ViewBuilder
    private var sectionCustom: some View {
        ScrollViewSection {
            ForEach(items) { item in
                Button {
                    debugPrint("Pressed button at index", index)
                } label: {
                    HStack(spacing: 10.0) {
                        /// Image
                        if let image = item.image {
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20.0, height: 20.0)
                        }
                        /// Title
                        Text(item.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.scrollViewRow)
                .scrollViewRowSeparatorInsets({
                    if let _ = item.image {
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
            Text("Custom section header")
        } footer: {
            Label("This can be something for example `Label(:systemImage:)` and every SwiftUI component is supported.", systemImage: "info.circle.fill")
        }
        .scrollViewSectionStyle(CustomScrollViewSectionStyle())
    }
    
    @ViewBuilder
    private var sectionGrouped: some View {
        ScrollViewSection {
            ForEach(items) { item in
                Button {
                    debugPrint("Pressed button at index", index)
                } label: {
                    HStack(spacing: 10.0) {
                        /// Image
                        if let image = item.image {
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20.0, height: 20.0)
                        }
                        /// Title
                        Text(item.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.scrollViewRow)
                .scrollViewRowSeparatorInsets({
                    if let _ = item.image {
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
            Text("Grouped section header style".uppercased())
        } footer: {
            Text("Grouped section footer style")
        }
        .scrollViewSectionStyle(.grouped)
    }
    
    @ViewBuilder
    private var sectionPlain: some View {
        ScrollViewSection {
            ForEach(items) { item in
                Button {
                    debugPrint("Pressed button at index", index)
                } label: {
                    HStack(spacing: 10.0) {
                        /// Image
                        if let image = item.image {
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20.0, height: 20.0)
                        }
                        /// Title
                        Text(item.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.scrollViewRow)
                .scrollViewRowSeparatorInsets({
                    if let _ = item.image {
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
            Text("Plain section header style".uppercased())
        } footer: {
            Text("Plain section footer style")
        }
        .scrollViewSectionStyle(.plain)
    }
    
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
