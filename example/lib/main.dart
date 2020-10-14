import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() {
  runApp(Flutter95App());
}

class Flutter95App extends StatelessWidget {
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
        Item95(
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
                          builder: (context) => ScreenThatCanPop()));
                    },
                    child: Text('Button95'),
                  ),
                  Button95(
                    child: Text('Disabled'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Text with Flutter95.textStyle',
                style: Flutter95.textStyle,
              ),
              const SizedBox(height: 4),
              Button95(
                onTap: () {
                  showDialog95(
                    context: context,
                    title: 'Error',
                    message: 'Task failed successfully',
                  );
                },
                child: Text('Show Error'),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField95(),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Screen that can pop',
      body: Container(),
    );
  }
}
