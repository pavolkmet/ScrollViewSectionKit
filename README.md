# ScrollViewSectionKit

A SwiftUI library that allows you to add native (`plain`, `grouped`, `insetGrouped`) or custom section styles within the `ScrollView` SwiftUI component.

<img src="Resources/Preview - 1.png" alt="The preview of the `ScrollViewSectionKit` on iPhones 14 Pro Max. The 1st one shows plain style. The 2nd one shows grouped style. The 3rd one shows inset grouped style. The 4th one shows custom style.">

## Overview
- 💎 Made with 100% SwiftUI.
- 🚀 Lightweight, no external dependencies.
- ✅ The API tries to mimic Apple's `List` component but you can use it within the `ScrollView` component.
- 🎨 The predefined `.plain`, `.grouped` and `.insetGrouped` section styles, but you can also define a completely custom section style.
- 🧪 Tested in multiple production applications.
- 📑 Well documented API.

## Requirements

- iOS 14.0+
- watchOS 7.0+
- tvOS 14.0+
- macOS 11.0+

## Installation

### Swift Package Manager

The `ScrollViewSectionKit` is available via the [Swift Package Manager](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

```
https://github.com/pavolkmet/ScrollViewSectionKit
```

### CocoaPods

The `ScrollViewSectionKit` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ScrollViewSectionKit'
```

Then just run `pod install`.

### Manually

Just drag and drop all files from folder `Source` in the `ScrollViewSectionKit` into your project and select `Copy items if needed`.

## Usage

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
            }
        }
        .scrollViewSectionStyle(.insetGrouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

See [example application](https://github.com/pavolkmet/ScrollViewSectionKit/tree/main/Example/ScrollViewSectionKitExample) for all examples and advanced usage.

## Configuration

### Section - Style

You can customize the appearance of section by applying different styles using the `scrollViewSectionStyle(_ style: any ScrollViewSectionStyle)` modifier. This modifier can be used globally or per section. The library already contains the `.plain`, `.grouped` and `.insetGrouped` styles.

In the following example the first `ScrollViewSection` uses the `.grouped` style because it is set as part of the `ScrollView` component but the second `ScrollViewSection` uses `.insetGrouped` style. This is because under the hood the `scrollViewSectionStyle(_ style: any ScrollViewSectionStyle)` modifier is using `EnvironmentKey`. This means that you can use this modifier to set a global style for the entire application.

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 1.png" width="320">
</p>

### Section - Background Color

You can customize the appearance of section by applying different background colors using the `scrollViewSectionBackgroundColor(_ color: Color)` modifier. This modifier can be used globally or per section.

In the following example the first `ScrollViewSection` uses the `.blue.opacity(0.28)` background color because it is set as part of the `ScrollView` component but the second `ScrollViewSection` uses `.orange.opacity(0.28)` background color. This is because under the hood the `scrollViewSectionBackgroundColor(_ color: Color)` modifier is using `EnvironmentKey`. This means that you can use this modifier to set a global style for the entire application. 

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
                .scrollViewSectionBackgroundColor(.orange.opacity(0.28))
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.blue.opacity(0.28))
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 2.png" width="320">
</p>

### Row - Background Color

You can customize the appearance of row by applying different background colors using the `scrollViewRowBackgroundColor(_ color: Color?)` modifier. This modifier can be used per section or per row.

In the following example the second row of the first section uses the `.blue.opacity(0.28)` background color because it is set as part of row. The first row of the second section, on the other hand, uses `.green.opacity(0.28)` background color because the entire section uses this modifier and the last row of the second section uses the `.orange.opacity(0.28)` background color.

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                        .scrollViewRowBackgroundColor(.blue.opacity(0.28))
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                        .scrollViewRowBackgroundColor(.orange.opacity(0.28))
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
                .scrollViewRowBackgroundColor(.green.opacity(0.28))
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 3.png" width="320">
</p>

### Row - Insets

You can also customize the appearance of row by applying different row insets using the `scrollViewRowInsets(_ insets: EdgeInsets?)` modifier. This modifier can be used per section or per row.

In the following example the whole first section uses `EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0)` row insets because the entire section uses this modifier. The first row of the second section, on the other hand, uses `EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0)` row insets because just this one row uses this modifier and the last row uses default row insets.

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewRowInsets(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0))
                ScrollViewSection {
                    HStack(spacing: 10.0) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20.0, height: 20.0)
                        Text("This is a 1st row.")
                    }
                    .scrollViewRowInsets(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0))
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 4.png" width="320">
</p>

### Row - Separator Insets

In the previous example we adjusted the row insets but the separators still use the default insets. We can change this by using `scrollViewRowSeparatorInsets(_ insets: EdgeInsets?)` modifier. This modifier can be used per section or per row.

In the following example the whole first section uses `EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0)` row separator insets because the entire section uses this modifier. The first row of the second section, on the other hand, uses `EdgeInsets(top: 0.0, leading: 70.0, bottom: 0.0, trailing: 0.0)` row separator insets because just this one row uses this modifier and the last row uses default row insets.

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewRowInsets(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0))
                .scrollViewRowSeparatorInsets(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0))
                ScrollViewSection {
                    HStack(spacing: 10.0) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20.0, height: 20.0)
                        Text("This is a 1st row.")
                    }
                    .scrollViewRowInsets(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 0.0))
                    .scrollViewRowSeparatorInsets(EdgeInsets(top: 0.0, leading: 70.0, bottom: 0.0, trailing: 0.0))
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 5.png" width="320">
</p>

### Row - Separator Tint

You can customize the appearance of row's separator by applying different tint colors using the `scrollViewRowSeparatorTint(_ color: Color?)` modifier. This modifier can be used per section or per row.

In the following example the second row's separator of the first section uses the `.blue` tint color because it is set as part of row. The first and third row's separator of the second section, on the other hand, uses `.green` tint color because the entire section uses this modifier and the second row's separator in the same section uses the `.orange` tint color.


```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                        .scrollViewRowSeparatorTint(.blue)
                    Text("This is a 3nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                        .scrollViewRowSeparatorTint(.orange)
                    Text("This is a 3nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
                .scrollViewRowSeparatorTint(.green)
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 6.png" width="320">
</p>

### Row - Context Menu

You can also add a context menu for the row by applying the `scrollViewRowContextMenu(@ViewBuilder _ menuItems: @escaping () -> some View)` modifier. This modifier can be used per section or per row.

In the following example the second row of the first section uses multiple buttons with the `Divider` component between them.

```swift
import ScrollViewSectionKit

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                        .scrollViewRowContextMenu {
                            Button {
                                
                            } label: {
                                Label("Star", systemImage: "star")
                            }
                            Button {
                                
                            } label: {
                                Label("Profile", systemImage: "person")
                            }
                            Divider()
                            Button(role: .destructive) {
                                
                            } label: {
                                Label("Block", systemImage: "hand.raised")
                            }
                        }
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                ScrollViewSection {
                    Text("This is a 1st row.")
                    Text("This is a 2nd row.")
                } header: {
                    Text("Section header".uppercased())
                } footer: {
                    Text("Section footer")
                }
                .scrollViewSectionStyle(.insetGrouped)
            }
        }
        .scrollViewSectionStyle(.grouped)
        .scrollViewSectionBackgroundColor(.clear)
        .background {
            Color(uiColor: UIColor.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
}
```

It should look like this ⬇️

<p align="center">
    <img src="Resources/Example 7.png" width="320">
</p>

## 🙌 Shoutouts

- [Moving Parts](https://twitter.com/movingpartsio) for an incredible article on [SwiftUI under the Hood: Variadic Views](https://movingparts.io/variadic-views-in-swiftui) that made all of this possible.
- [Federico Zanetello](https://twitter.com/zntfdr) once again for an amazing article on [How to create custom SwiftUI view styles](https://www.fivestars.blog/articles/custom-view-styles/) which helped me a lot during the development of this library.

## Author

- Twitter: [@PavolKmet](https://twitter.com/PavolKmet)

## License

```
MIT License

Copyright (c) 2023 Pavol Kmet

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
