# ScrollViewSectionKit

A SwiftUI library that allows you to add native (`plain`, `grouped`, `insetGrouped`) or custom section styles within the `ScrollView` SwiftUI component.

<img src="Resources/Preview - 1.png" alt="The preview of the `ScrollViewSectionKit` on iPhones 14 Pro Max. The 1st one shows plain style. The 2nd one shows grouped style. The 3rd one shows inset grouped style. The 4th one shows custom style.">

## Overview
- 📑 Well documented API.
- ✅ The API tries to mimic Apple's `List` component but you can use it within the `ScrollView` component.
- 🎨 You can create custom section style.

## Requirements

- iOS 14.0+,
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

If you want to use a different style for your section you can simply use ⬇️ function which can be used globally or per section.
```swift
func scrollViewSectionStyle(_ style: any ScrollViewSectionStyle) -> some View
```

Example:
```

```

### Section - Background Color

If you want to have a different background color of your section you can simply use ⬇️ function which can be used globally or per section.
```swift
func scrollViewSectionBackgroundColor(_ color: Color) -> some View
```

### Row - Background Color

If you want to have a different background color of your row you can simply use ⬇️ function.
```swift
func scrollViewRowBackgroundColor(_ color: Color) -> some View
```

### Row - Insets

If you want to have a different row insets of your row you can simply use ⬇️ function.
```swift
func scrollViewRowInsets(_ insets: EdgeInsets?) -> some View
```

### Row - Separator Insets

If you want to have a different row separator insets of your row you can simply use ⬇️ function.
```swift
func scrollViewRowSeparatorInsets(_ insets: EdgeInsets?) -> some View
```

### Row - Context Menu

If you want to have a context menu for your row you can simply use ⬇️ function.

```swift
func scrollViewRowContextMenu(@ViewBuilder _ menuItems: @escaping () -> some View) -> some View
```

## 🙌 Shoutouts

- [Moving Parts](https://twitter.com/movingpartsio) for an incredible article on [SwiftUI under the Hood: Variadic Views](https://movingparts.io/variadic-views-in-swiftui) that made all of this possible.
- [Federico Zanetello](https://twitter.com/zntfdr) once again for an amazing article on [How to create custom SwiftUI view styles](https://www.fivestars.blog/articles/custom-view-styles/) which helped me a lot during the development of this library.

## Author

- Email: [pavolkmet@icloud.com](mailto:pavolkmet@icloud.com)
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
