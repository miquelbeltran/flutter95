# Flutter95

Windows95 UI components for Flutter apps.

**UNDER CONSTRUCTION**

## Screenshots

<img src="https://github.com/miquelbeltran/flutter95/raw/master/art/screenshot.png" alt="Screenshot" width="200"/>

## Components

#### Scaffold95

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

#### Menu95

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

#### Button95

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

#### Checkbox95

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

#### TextField95

TextField styled as a Windows95 text field.

* Uses a Material TextField internally.

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