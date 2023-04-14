# ScrollViewSectionKit

A SwiftUI library that allows you to add native (`plain`, `grouped`, `insetGrouped`) or custom section styles within the `ScrollView` SwiftUI component.

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
