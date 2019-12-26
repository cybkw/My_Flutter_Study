import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyPointEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '指针',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PointEventPage(title: "指针是什么"),
    );
  }
}

class PointEventPage extends StatefulWidget {
  final String title;

  PointEventPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PageState();
  }
}

class PageState extends State<PointEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Listener(
//        child: Container(
//          width: 300,
//          height: 300,
//          alignment: Alignment.center,
//          color: Colors.green,
//          child: Center(
//            child: Text("命中测试"),
//          ),
//        ),
//        onPointerDown: (event) {
//          print(event.toString());
//        },
//        onPointerMove: (event) {
//          print(event.toString());
//        },
//        onPointerUp: (event) {
//          print(event.toString());
//        },
//        behavior: HitTestBehavior.opaque,
//      ),
//      body: Stack(
//        children: <Widget>[
//          Listener(
//            child: Container(
//              width: 300,
//              height: 300,
//              color: Colors.green,
//            ),
//            onPointerDown: (event) {
//              print("down");
//            },
//          ),
//          Listener(
//            child: Container(
//              width: 200,
//              height: 200,
//              color: Colors.blue,
//              child: Center(
//                child: Text("命中测试"),
//              ),
//            ),
//            onPointerDown: (event) {
//              print("up");
//            },
//            behavior: HitTestBehavior.translucent,
//          ),
//        ],
//      ),

      body: Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            onPointerDown: (event) {
              print("inner");
            },
          ),
        ),
      ),
    );
  }
}

class GesturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势"),
      ),
      body: GestureDetector(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.amberAccent,
        ),
        onTap: () {
          print("onTap");
        },
        onDoubleTap: () {
          print("onDoubleTap");
        },
        onLongPress: () {
          print("onLongPress");
        },
      ),
    );
  }
}

class GestureF extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureS2();
  }
}

class GestureS extends State<GestureF> {
  double _top = 50;
  double _left = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("手势-拖动widget")),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/ic_launcher.png",
                  width: _left,
                  height: _top,
                ),
              ),
              //随意拖动
//              onPanUpdate: (details){
//                setState(() {
//                  _top+=details.delta.dy;
//                  _left+=details.delta.dx;
//                });
//              },
              //只垂直拖动
//              onVerticalDragUpdate: (details) {
//                _top += details.delta.dy;
//                setState(() {});
//              },

              //只水平拖动
//              onHorizontalDragUpdate: (details) {
//                _left += details.delta.dx;
//                setState(() {});
//              },

              //缩放事件
//              onScaleUpdate:(details){
//                _top=50*details.scale;
//                _left=50*details.scale;
//              },
            ),
          )
        ],
      ),
    );
  }
}

class GestureS2 extends State<GestureF> {
  TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //释放资源
    _recognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别"),
        ),
        body: Center(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: "link"),
              TextSpan(
                  text: "www.cy.com",
                  style: TextStyle(color: Colors.red),
                  recognizer: _recognizer
                    ..onTap = () {
                      //点击事件
                      print("链接被点击了");
                    }),
            ]),
          ),
        ));
  }
}
