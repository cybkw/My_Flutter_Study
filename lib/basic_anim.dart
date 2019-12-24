import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicState();
  }
}

class BasicState extends State<BasicAnimation>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _tween = Tween(begin: 0, end: 300);
    _animation = _tween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: SizedBox(
          width: _animation.value,
          height: _animation.value,
          child: Image.network(
              "https://dss1.bdstatic.com/6OF1bjeh1BF3odCf/it/u=420019362,1260823197&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=d49d09209855618b960a21486d3a5230"),
        ),
      ),
    );
  }
}

class AnimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BasicAnimation();
            }));
          },
          child: Text("跳转新页面"),
        ),
      ),
    );
  }
}
