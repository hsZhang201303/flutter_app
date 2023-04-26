import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StateFulGroup extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _StateFulGroupState createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StateFulGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StateFulGroup Widget',
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
        appBar: AppBar(title: Text('stateLessGroup Widget'),
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
        body: _currentIndex == 0 ?
        RefreshIndicator(child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.lightGreen),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text('I am a Text',
                    style: textStyle,),
                  Icon(
                    Icons.android,
                    size: 50,
                    color: Colors.red,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      hintText: 'please input',
                      hintStyle: TextStyle(fontSize: 20)
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: Colors.lightBlue),
                    child: PageView(
                      children: <Widget>[
                        _item('Page1', Colors.red),
                        _item('Page2', Colors.green),
                        _item('Page3', Colors.yellow)
                      ],
                    ),
                  ),
                  Image.network('https://inews.gtimg.com/newsapp_bt/0/13399531552/1000', width: 100, height: 120,),
                  CloseButton(),
                  BackButton(),
                  Divider(
                    height: 10,  //container height, not line height
                    indent: 20, //left indent
                    endIndent: 20,
                    color: Colors.red,
                  ),
                  Chip(label: Text('I am a Chip Label'),
                    avatar: Icon(Icons.people),),
                  Card(
                    color: Colors.orange,
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text('I am zhang bo yue',
                        style: textStyle,),

                    ),
                  ),
                  AlertDialog(
                    title: Text('I am alert title'),
                    content: Text('I am content'),
                  )
                ],
              ),
            )
          ],
        ) , onRefresh: _handleRefresh)
            : Text('lie biao'),
      ),
    );
}

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
