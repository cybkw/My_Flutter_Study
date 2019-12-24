import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '列表组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: SimpleListViewBuilder(),
//      home: SimpleListView(),
//      home: SimpleListViewSeparated(),
//      home: SimpleListView2(),
//            home: SimpleGridView(),
//      home:SimpleGridView2(),
      home:SimpleGridView3(),
    );
  }
}

//列表组件
class SimpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView 简单列表"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        itemExtent: 250, //指定item高度
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Container(
            height: 80,
            color: Colors.yellow,
          ),
          Container(
            height: 100,
            color: Colors.green,
          ),
          Container(
            height: 100,
            color: Colors.grey,
          ),
          Container(
            height: 100,
            color: Colors.white,
          ),
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 100,
            color: Colors.green,
          ),
          Container(
            height: 80,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

//长列表
class SimpleListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.builder长列表"),
      ),
      body: ListView.builder(
        itemCount: 50, //null表示无限列表
        itemExtent: 85, //指定item高度
        itemBuilder: (BuildContext context, int index) {
          //奇数显示蓝色,偶数显示绿色
          return index % 2 == 0
              ? Container(
                  color: Colors.green,
                  height: 100,
                )
              : Container(
                  color: Colors.blue,
                  height: 50,
                );
        },
      ),
    );
  }
}

//分割样式列表组件
class SimpleListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.separated 长列表"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            //奇数显示蓝色,偶数显示绿色
            return index % 2 == 0
                ? Container(
                    color: Colors.green,
                    height: 100,
                  )
                : Container(
                    color: Colors.blue,
                    height: 50,
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 2,
              color: Colors.black,
              thickness: 2,
            );
          },
          itemCount: 30),
    );
  }
}

//分步加载, 上拉加载更多
class SimpleListView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SimpleListView2State();
  }
}

class SimpleListView2State extends State<SimpleListView2> {
  //数据源
  List<String> _words = <String>[''];

  void _loadWords() {
    Future.delayed(Duration(microseconds: 1000)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载更多列表"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == _words.length - 1) {
              if (_words.length - 1 < 100) {
                //加载数据
                _loadWords();
                //显示加载进度条
                return Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text("没有更多了"),
                );
              }
            }

            //添加数据
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            );
          },
          itemCount: _words.length),
    );
  }
}


class SimpleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple GridView'),
      ),
      body: GridView(
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
        ],
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3, childAspectRatio: 2.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80, childAspectRatio: 2.0),
      ),
    );
  }
}

class SimpleGridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple GridView2'),
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 80,
          childAspectRatio: 2.0,
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ));
  }
}

class SimpleGridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple GridView3'),
      ),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Container(
              color: Colors.green,
            )
                : Container(
              color: Colors.yellow,
            );
          }),
    );
  }
}

