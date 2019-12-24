import 'package:flutter/material.dart';
import 'package:flutter_1_2_1/layout.dart';
import 'package:flutter_1_2_1/list_widget.dart';
import 'package:flutter_1_2_1/router.dart';
import 'package:flutter_1_2_1/basic_anim.dart';
import 'package:flutter_1_2_1/anim_widget.dart';
import 'package:flutter_1_2_1/anim_builder.dart';
void main() => runApp(MyAnimApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SimpleListView2(),
    );
  }
}

/***
 * 路由
 * */
class MyRouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "路由管理",
      theme: ThemeData(primaryColor: Colors.blue),
      //注册路由
      routes: {
        '/': (context) => FirstPager(),
        '/second_page': (context) => SecondPager(),
        '/three_page': (context) => ThreePage("命名路由跳转"),
        '/FourPager': (context) => FourPager(),
      },

      initialRoute: '/',
      //指明首页面

      onGenerateRoute: (settings) {
        if (settings.name == "/FivePage") {
          var arg = settings.arguments;
          return MaterialPageRoute(
              builder: (context) => FivePager(arg), settings: settings);
        }
      },
    );
  }
}

/**
 * 动画
 * */
class MyAnimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "动画",
      theme: ThemeData(primaryColor: Colors.blue),
      home: AnimBuilder(),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewPageState();
  }
}

class NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 120, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: logo() + createBtn() + createBtn2(),
        ),
      ),
    );
  }

  List<Widget> logo() {
    return <Widget>[
      Image(
        image: AssetImage('assets/images/ic_launcher.png'),
        width: 100,
        height: 100,
        fit: BoxFit.fitHeight,
      ),
      SizedBox(
        height: 10,
        width: 10,
      ),
      Text(
        "welcome",
        style: TextStyle(
            color: Color(0XFF333333),
            fontSize: 20,
            decoration: TextDecoration.none),
        textAlign: TextAlign.center,
      )
    ];
  }

  List<Widget> createBtn() {
    return <Widget>[
      SizedBox(
        height: 118,
      ),
      Material(
        child: RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          disabledColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Text(
            "第一个按钮",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(2))),
        ),
      )
    ];
  }

  List<Widget> createBtn2() {
    return <Widget>[
      SizedBox(
        height: 16,
      ),
      Material(
        child: FlatButton(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(
              "第二个按钮",
              style: TextStyle(color: Colors.black54, fontSize: 16),
              textAlign: TextAlign.center,
            )),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(2))),
      )
    ];
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
