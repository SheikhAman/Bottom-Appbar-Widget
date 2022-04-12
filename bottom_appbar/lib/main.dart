import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomAppbar(),
    );
  }
}

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  bool _isBottomBarNotched = false;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ListTile(
            title: Text('FloatingActionButton position:'),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: _fabLocation,
              onChanged: (FloatingActionButtonLocation? newVal) {
                if (newVal != null) {
                  setState(() => this._fabLocation = newVal);
                }
              },
              items: [
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerFloat,
                  child: Text('centerFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endFloat,
                  child: Text('endFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text('centerDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endDocked,
                  child: Text('endDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.miniStartTop,
                  child: Text('miniStartTop'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.startTop,
                  child: Text('startTop'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Mini FAB:'),
            trailing: Switch(
              value: this._isFabMini,
              onChanged: (bool val) {
                setState(() => this._isFabMini = val);
              },
            ),
          ),
          ListTile(
            title: Text('BottomAppBar notch:'),
            trailing: Switch(
              value: this._isBottomBarNotched,
              onChanged: (bool val) {
                setState(() => this._isBottomBarNotched = val);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: this._isFabMini,
        onPressed: () =>
            Fluttertoast.showToast(msg: 'Dummy floating action button'),
      ),
      floatingActionButtonLocation: this._fabLocation,
      bottomNavigationBar: this._buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: this._isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          // Bottom that pops up from the bottom of the screen.
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 200,
                child: Text('Dummy bottom sheet'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                Fluttertoast.showToast(msg: 'Dummy search action.'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => Fluttertoast.showToast(msg: 'Dummy menu action.'),
          ),
        ],
      ),
    );
  }
}
