import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() {
  runApp(const Flutter95App());
}

class Flutter95App extends StatelessWidget {
  const Flutter95App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Flutter95.background,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ValueNotifier<bool> checkboxValue = ValueNotifier<bool>(false);

  final _divider = const Divider95(
    height: 20,
    endIndent: 8,
    indent: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Flutter95',
      toolbar: Toolbar95(actions: [
        Item95(
          label: 'File',
          menu: _buildMenu(),
        ),
        Item95(
          label: 'Edit',
          onTap: (context) {},
        ),
        const Item95(
          label: 'Save',
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Elevation95(
          type: Elevation95Type.down,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button95(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScreenThatCanPop(),
                      ));
                    },
                    child: const Text('Button95'),
                  ),
                  const Button95(
                    child: Text('Disabled'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ValueListenableBuilder(
                valueListenable: checkboxValue,
                builder: (context, value, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox95(
                        value: value,
                        label: "Enabled",
                        onChanged: (value) {
                          if (kDebugMode) {
                            print(value);
                          }
                          checkboxValue.value = (value);
                        },
                      ),
                      const SizedBox(width: 20),
                      Checkbox95(
                        value: value,
                        label: "Disabled",
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 4),
              const Text(
                'Text with Flutter95.textStyle',
                style: Flutter95.textStyle,
              ),
              _divider,
              const Tooltip95(
                message: 'Hello from Flutter95!',
                child: Text(
                  'Long press on this to see a tooltip',
                  style: Flutter95.textStyle,
                ),
              ),
              _divider,
              Button95(
                onTap: () {
                  showDialog95(
                    context: context,
                    title: 'Error',
                    message: 'Task failed successfully',
                  );
                },
                child: const Text('Show Error'),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField95(),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField95(
                  height: 150,
                  maxLines: 10,
                  multiline: true,
                ),
              ),
              _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  Menu95 _buildMenu() {
    return Menu95(
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
  }

  /// Build a ListView wrapping it in [Elevation95] with [Elevation95Type.down].
  /// This will create a "deep" container.
  /// Then wrap each item with [Elevation95Type.up] to create an up effect.
  Padding _buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Elevation95(
        type: Elevation95Type.down,
        child: SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Elevation95(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Item $index',
                    style: Flutter95.textStyle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ScreenThatCanPop extends StatelessWidget {
  const ScreenThatCanPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Screen that can pop',
      body: Container(),
    );
  }
}
