# BindingKit

A set of handy additions to the basic SwiftUI Binding type.

## Motivation

When using bindings extensively you might find yourself writing some repetitive code.
This package aims to add some useful operations to `Binding` which should
make working with them easier. Particularly, if you don't want to send the whole
wrapped value to a child view or if you want to transform the wrapped value to a different type.

## Features

- Coalescing of optional wrapped values.
- “Will set” and “did set“ side-effects for debugging.
- Two-way map function for transforming wrapped value back and forth.
- Creation of `Binding` with stored value for those cases where constant binding does not suffice. 
- Creating Binding from a property of some reference-type.

## Installation

Add this package to your Xcode project or add following line
to your `Package.swift` file:

```swift
.package(url: "https://github.com/mkj-is/BindingKit.git", from: "1.0.0")
```

## Contributing

All contributions are welcome.

Project was created by [Matěj Kašpar Jirásek](https://twitter.com/mkj_is).

Project is licensed under [MIT license](LICENSE).
