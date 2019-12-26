import 'package:flutter/material.dart';

/**
 * 同步动画
 * */
class SyncAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicState();
  }
}

class BasicState extends State<SyncAnim> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Tween<double> _tween;
  Tween<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _tween = Tween(begin: 0, end: 300);
    _opacity = Tween(begin: 0, end: 0.5);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: _opacity.evaluate(_animation),
            child: SizedBox(
              width: _tween.evaluate(_animation),
              height: _tween.evaluate(_animation),
              child: Image.network(
                  "https://dss1.bdstatic.com/6OF1bjeh1BF3odCf/it/u=420019362,1260823197&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=d49d09209855618b960a21486d3a5230"),
            ),
          ),
        );
      },
    );
  }
}
