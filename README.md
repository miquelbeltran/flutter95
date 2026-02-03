# Flutter95

Windows95 UI components for Flutter apps.

## Screenshots

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/screenshot.png" alt="Screenshot" width="200"/>

## Components

### Scaffold95

Scaffold as a Windows95 styled window.

* Provides title.
* Optional: toolbar that requires `Item95` action items.

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/scaffold95_2.png" alt="Screenshot" width="200"/>

* If a scaffold `canPop` (meaning it is not a root of the app) then a close button appears.

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/scaffold95_1.png" alt="Screenshot" width="200"/>

```dart
Scaffold95(
  title: 'Flutter95',
  toolbar: Toolbar95(
    actions: [
      Item95(
        label: 'File', 
        onTap: () {},
      ),
    ],
  ),
  body: Container(),
)
```

You can provide a custom `WindowHeader95` to override the default `Scaffold95` header.

```dart
Scaffold95(
  customHeader: WindowHeader95(
    child: Row(/* etc */),
  ),
  body: Container(),
)
```

### Menu95

Windows95 styled menu.

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/menu95.png" alt="Screenshot" width="200"/>

* Easy API wrapping Material's `showMenu`.

```dart
Menu95(
  items: [
    MenuItem95(
      value: 1,
      label: 'New',
    ),
    MenuItem95(
      value: 2,
      label: 'Open',
    ),
    MenuItem95(
      value: 3,
      label: 'Exit',
    ),
  ],
  onItemSelected: (item) {},
);
```

* Display using `show(context, position)`.

```dart
menu.show(
  context,
  Offset(50, 100),
);
```

* Use it directly with Item95 to be positioned automatically.

```dart
Item95(
  label: 'File',
  menu: Menu95(...),
),
```

### Button95

Windows95 styled button.

* Provides default text style for child widgets.
* Provides default padding for children.
* If `onTap` is null, acts as a disabled button.

```dart
Button95(
  onTap: () {},
  child: Text('Button95'),
)
```

### Checkbox95

Windows95 styled checkbox

* Provides label in windows95 style.
* If `onChanged` is null, acts as a disabled checkbox.

```dart
Checkbox95(
    value: value,
    label: "Some Label", // optional, if null no label is shown
    onChanged: (value) {}, // optional, if null acts as a disabled checkbox
)
```

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/checkbox95.png" alt="Checkbox95" width="200"/>

#### TextField95

TextField styled as a Windows95 text field.

* Uses a Material TextField internally.

```dart
TextField95()
```

### Tooltip95

A tooltip widget designed in Windows95 style.

* Works just like Material's `Tooltip`.

```dart
Tooltip95(
    message: 'Hello from Flutter95!',
    child: Text('I have a tooltip for you!'),
)
```

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/tooltip95.png" alt="Tooltip95" width="200"/>

### Divider95

A divider widget designed in Windows95 style.

* Works just like Material's `Divider`.
* Supports indent, endIndent and height.

```dart
Divider95()
```

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/divider95.png" alt="Divider95" width="200"/>

### Elevation95

Creates an effect of deepness and elevation around Widgets.

```dart
Elevation95(
  child: Text('Elevated Text')
)
```

### Flutter95.textStyle

TextStyle ready to use that copies the Windows95 text style.

```dart
Text(
  'Text with Flutter95.textStyle',
  style: Flutter95.textStyle,
);
```

### Dialogs

```dart
showDialog95(
  context: context,
  title: 'Error',
  message: 'Task failed successfully',
);
```

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/dialog.png" alt="Dialog" width="200"/>

## Contributing

You can contribute in different ways:

* Creating new Windows95 styled components.
  * Please include screenshots in your PRs!
  * Please update the example and tests to include the new component!
* Improving existing components with better options.
* Improving documentation both in code and this README file.
* Creating more tests.
* Improving CI scripts.
* Fixing lint issues.
* Creating feature requests.
  * Please include a screenshot.
  * Also don't expect a quick response, this is a hobby project.
* Reporting bugs.

## Acknowledgments

Heavily inspired by [React95](https://github.com/arturbien/React95).

Featured in [My Windows 95 ChatGPT app](https://www.youtube.com/watch?v=sXBWzFmLMxY) by @filiph.
