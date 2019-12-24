import 'package:flutter/material.dart';

void main() => runApp(Layout());

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '布局组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: SimpleRow(),
//      home: SimpleColumn(),
//      home: SimpleFlex(),
      home: SimpleStack(),
    );
  }
}

class SimpleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局组件-Simple Row"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "World",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              Text(
                "World",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "World",
                style: TextStyle(color: Colors.red, fontSize: 23),
              )
            ],
          ),
          Row(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.blue, fontSize: 26),
              ),
              Text(
                "World",
                style: TextStyle(color: Colors.red, fontSize: 38),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SimpleColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Column -列"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, //从底部
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center, //主轴方向
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
              Text(
                "树先生",
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Hello",
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
              Text(
                "树先生",
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//弹性布局
class SimpleFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局-Flex"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 50,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              height: 50,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black45,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}

//层叠布局
class SimpleStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("层叠布局-Stack")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(width: 200, height: 200, color: Colors.red),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(width: 50, height: 50, color: Colors.black45),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                Container(width: 200, height: 200, color: Colors.red),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(width: 50, height: 50, color: Colors.black45),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.red,
                ),
                Positioned(
                  left: 100,
                  child: Container(
                    color: Colors.green,
                    width: 50,
                    height: 50,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
