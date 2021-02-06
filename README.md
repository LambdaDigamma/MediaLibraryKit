# MediaLibrary
> Provides models and interaction with Spaties [laravel-medialibrary](https://github.com/spatie/laravel-medialibrary) php package.

MediaLibrary provides a simple but very customizable way to interact with 



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

```json
{
    "id": 2,
    "model_type": "App\\Models\\SomeModel",
    "model_id": 1,
    "uuid": "15b010ea-1f12-48fd-a091-c2372a754bbb",
    "collection_name": "header",
    "name": "some-image.png",
    "file_name": "some-filename.png",
    "mime_type": "image/png",
    "disk": "public",
    "conversions_disk": "public",
    "size": 157787,
    "manipulations": [],
    "custom_properties": [],
    "order_column": 0,
    "created_at": "2020-11-30T13:17:36.000000Z",
    "updated_at": "2020-11-30T15:01:28.000000Z"
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
