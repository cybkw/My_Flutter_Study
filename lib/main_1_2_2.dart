import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1_2_1/font.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 基础组件'),
//      home: NewPage(),
    );
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

  //输入框
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //输入框
    _controller = TextEditingController(text: "input phone");
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              "TEXT 1",
              style: TextStyle(color: Colors.red, fontSize: 20),
              textDirection: TextDirection.ltr,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Text rich_Link"),
              TextSpan(
                text: "www.163.com",
                style: TextStyle(color: Colors.blue),
              )
            ])),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "请输入 phone", border: OutlineInputBorder()),
              //输入框样式
//              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormater(11)],  //过滤输入
              obscureText: true, //隐藏输入内容
            ),

            //显示本地图片
            Image(
//
              image: AssetImage("assets/images/ic_launcher.png"),
              height: 100,
              width: 100,
            ),

            //显示网络图片
            Image(
              image: NetworkImage(
                  "https://edu-image.nosdn.127.net/fc82733ea0534a34bcbbe67ad7abf8f8.jpg?imageView&quality=100&thumbnail=1205y400"),
              height: 100,
              width: 80,
            ),
            ClipOval(
                child: Image.network(
              "https://edu-image.nosdn.127.net/fc82733ea0534a34bcbbe67ad7abf8f8.jpg?imageView&quality=100&thumbnail=1205y400",
              width: 50,
              height: 50,
            )),

            //Icon 内置矢量图使用
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 50,
            ),
            //外部矢量图 .ttf 使用
            Icon(
              IconFont.iconyx_pc_narrowx,
              color: Colors.green,
              size: 50,
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
