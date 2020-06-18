# Flutter95

Windows95 UI components for Flutter apps.

**UNDER CONSTRUCTION**

## Screenshots

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/screenshot.png" alt="Screenshot" width="200"/>

## Components

#### Scaffold95

Scaffold as a Windows95 styled window.

* Provides title.
* Provides a close button `CloseButton95` which performs a `Navigator.pop`.
* Provides a toolbar that requires `Item95` action items.

```dart
Scaffold95(
  title: 'Flutter95',
  toolbar: Toolbar95(
    actions: [Item95(label: 'File', onTap: () {})],
  ),
  body: Container(),
)
```

#### Button95

Windows95 styled button.

* Provides default text style for child widgets.
* Provides default padding for children.

```dart
Button95(
  onTap: () {},
  child: Text('Button95'),
)
```

#### TextField95

Material text field styled as a Windows95 text field.

```dart
TextField95()
```

#### Elevation95

Creates an effect of deepness and elevation around Widgets.

```dart
Elevation95(
  child: Text('Elevated Text')
)
```

#### Flutter95.textStyle

TextStyle ready to use that copies the Windows95 text style.

```dart
Text(
  'Text with Flutter95.textStyle',
  style: Flutter95.textStyle,
);
```

### Acknowledgments

Heavily inspired by [React95](https://github.com/arturbien/React95).