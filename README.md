# Tree

[![CI Status](https://img.shields.io/travis/iTofu/Tree.svg?style=flat)](https://travis-ci.org/iTofu/Tree)
[![Version](https://img.shields.io/cocoapods/v/Tree.svg?style=flat)](https://cocoapods.org/pods/Tree)
[![License](https://img.shields.io/cocoapods/l/Tree.svg?style=flat)](https://cocoapods.org/pods/Tree)
[![Platform](https://img.shields.io/cocoapods/p/Tree.svg?style=flat)](https://cocoapods.org/pods/Tree)
[![Laguage](https://img.shields.io/badge/language-Swift%20%26%20ObjC-orange.svg)](https://github.com/iTofu/Tree)
[![CocoaPods](https://img.shields.io/cocoapods/dt/Tree.svg)](https://cocoapods.org/pods/Tree)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](https://leodev.me)
[![GitHub stars](https://img.shields.io/github/stars/iTofu/Tree.svg?style=social&label=Star)](https://github.com/iTofu/Tree)

🎏 Tree can help you manage views more clearly.

⚠️ **If you using this lib after Swift 5.4, you could `@_exported import Tree`, otherwise you may have to `import Tree` everywhere.** [Swift Bugfix Link](https://forums.swift.org/t/exported-import-does-not-properly-export-custom-operators/39090)

> Checking your current swift version:
>  ```shell
>  swift --version
>  ```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="https://raw.githubusercontent.com/iTofu/Tree/master/Misc/ScreenShot_01.png" width="428" height="926" alt="ScreenShot_01" align=center />

## Requirements

- iOS 8.0+

## Installation

Tree is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Tree'
```

## Usage

- Add subviews (or stackView) or layers:

  ```swift
  // import
  import Tree
  // or global import
  @_exported import Tree
  
  // view
  view <- [
    aView,
    bView <- [
      cView,
    ],
    dLayer,
    eStackView <- [
      fButton,
      gButton,
      (hButton, 0), // insert hButton at index 0
    ],
    judge ? iView : nil,
  ]
  
  // layer
  layer <- [
    aLayer,
    bLayer,
    nil,
    // lalala...
  ]
  ```

## Author

Leo, leodaxia@gmail.com

## License

Tree is available under the MIT license. See the LICENSE file for more info.
