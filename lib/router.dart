import 'package:flutter/material.dart';

//路由管理
class PagerRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由管理",
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: FirstPager(),
    );
  }
}

class FirstPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("跳转页面"),
            onPressed: () async {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => SecondPager()));

              //路由传值
//              var result = await Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => ThreePage("arg 来自于首页")));
//              print(result);

              //命名路由跳转
//              Navigator.pushNamed(context, '/second_page');
//              Navigator.pushNamed(context, '/three_page');
//              var result = await Navigator.pushNamed(context, '/FourPager',
//                  arguments: 'arg 来自首页');
//              print(result);

              //路由命名,未在路由表中注册的方式
//              var result = await Navigator.pushNamed(context, '/FivePage',
//                  arguments: 'arg 来自首页');
//              print(result);

              //路由动画
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SecondPage2(),
                        );
                      }));
            }),
      ),
    );
  }
}

/***
 * 路由跳转
 * */
class SecondPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("回到第一页"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

/***
 * 路由传值
 * */
class ThreePage extends StatelessWidget {
  final String arg;

  ThreePage(this.arg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三个页面-路由传值"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(arg),
          RaisedButton(
            child: Text("回到首页"),
            onPressed: () {
              Navigator.pop(context, "Result 来自于 Three Pager");
            },
          )
        ],
      )),
    );
  }
}

/**
 * 命名路由参数传递
 * */
class FourPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由参数传值"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arg),
            RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context, "返回参数");
              },
            )
          ],
        ),
      ),
    );
  }
}

/**
 * 命名路由: on
 * */
class FivePager extends StatelessWidget {
  final String arg;

  FivePager(this.arg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由-Five"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arg),
            RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context, "返回参数");
              },
            )
          ],
        ),
      ),
    );
  }
}

/**
 * 路由动画
 * */
class SecondPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page2-路由动画"),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: RaisedButton(
            color: Colors.green,
            child: Text("Go back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
