import 'package:flutter/material.dart';

class WidgetAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetAnimationState();
  }
}

class AnimWidget extends AnimatedWidget {
  AnimWidget({Animation animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Center(
      child: SizedBox(
        width: animation.value,
        height: animation.value,
        child: Image.network(
            "https://dss1.bdstatic.com/6OF1bjeh1BF3odCf/it/u=420019362,1260823197&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=d49d09209855618b960a21486d3a5230"),
      ),
    );
  }
}

class WidgetAnimationState extends State<WidgetAnimation>
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
    _animation = _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimWidget(
      animation: _animation,
    );
  }
}
