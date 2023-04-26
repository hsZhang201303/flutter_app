import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class GesturePage extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  int _currentIndex = 0;
  String printString = '';
  double moveX =0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'GesturePage Widget',
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
      home: Scaffold(
        appBar: AppBar(title: Text('Gesture Page'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
              setState(() {
                _currentIndex = index;
              });
          },
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey,),
              activeIcon: Icon(Icons.home, color: Colors.blue,),
              label:'Homee'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.grey,),
              activeIcon: Icon(Icons.list, color: Colors.blue,),
              label:'Listt'
          ),
        ],),
        floatingActionButton: FloatingActionButton (
          onPressed: null,
          child: Text('click'),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('取消'),
                    onTapUp: (e) => _printMsg('松开'),
                    onTapDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                top: moveY,
                left: moveX,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.amber,
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                ),
              )
            ],
          ),
        )

      ),
    );
}
  _printMsg(String msg) {
    setState(() {
      printString += '    ,$msg';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
