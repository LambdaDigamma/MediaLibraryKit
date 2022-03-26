# MediaLibraryKit

<p align="left">
<img src="https://img.shields.io/apm/l/atomic-design-ui.svg">
<img src="https://img.shields.io/badge/platforms-iOS%2C%20macOS%2C%20watchOS%2C%20tvOS-lightgrey.svg">
<img alt="Swift" src="https://github.com/LambdaDigamma/medialibrary-ios/actions/workflows/swift.yml/badge.svg">
</p>

Interact and work with the [Laravel MediaLibrary package](https://github.com/spatie/laravel-medialibrary) in your app.


## Installation

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/LambdaDigamma/medialibrary-ios.git", majorVersion: 1, minor: 0)
    ]
)
```

## Getting started

This package provides codable models for a media object and a media collection container for decoding entire collections.

```swift
import MediaLibraryKit

struct Post: Codable {

    let header: Media
    
}

```


### Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information on what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

### Security

If you discover any security related issues, please email info@lambdadigamma.com instead of using the issue tracker.

## Credits

- [Lennart Fischer](https://github.com/lambdadigamma)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
