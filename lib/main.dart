import 'package:flutter/material.dart';
import 'package:my_app/launch_page.dart';
import 'package:my_app/plugin_use.dart';
import 'package:my_app/res_page.dart';
import 'package:my_app/stateful_group_page.dart';

import 'flutter_layout_page.dart';
import 'gesture_page.dart';
import 'less_group_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const RouteNavigator(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由和导航？'),
        ),
        body: RouteNavigator(
          title: 'title RouteNavigator',
        ),
      ),
      routes: <String, WidgetBuilder>{
        'Plugin': (BuildContext context) => PluginUse(),
        'Less': (BuildContext context) => LessGroupPage(),
        'Ful': (BuildContext context) => StateFulGroup(),
        'Layout': (BuildContext context) => FlutterLayoutPage(),
        'Gesture': (BuildContext context) => GesturePage(),
        'ResPage': (BuildContext context) => ResPage(),
        'LaunchPage': (BuildContext context) => LaunchPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  int _counter = 0;
  bool byName = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : 'not'}通过路由名跳转'),
              value: byName, onChanged: (value) {
            setState(() {
              byName = value;
            });
          }),

          _item('StateLessWidget和组件', LessGroupPage(), 'Less'),
          _item('How to use Color Widget', PluginUse(), 'Plugin'),
          _item('FlutterLayoutPage Widget', FlutterLayoutPage(), 'Layout'),
          _item('StateFulGroup Widget', StateFulGroup(), 'Ful'),
          _item('Gesture Page', GesturePage(), 'Gesture'),
          _item('Res Page', ResPage(), 'ResPage'),
          _item('How to launch a third app', LaunchPage(), 'LaunchPage'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton (
        onPressed: (){
          if (byName) {
            Navigator.pushNamed(context, routeName);
          }else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
