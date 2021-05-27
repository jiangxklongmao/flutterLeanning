import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/27 18:11
///    desc   :
///    version: 1.0
class AnimationBaseDemo extends StatefulWidget {
  const AnimationBaseDemo({Key key}) : super(key: key);

  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}

class _AnimationBaseDemoState extends State<AnimationBaseDemo>
    with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {
              _size = 100 + 100 * _controller.value;
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _controller.forward();
              if (_size == 100) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Container(
            height: _size,
            width: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "点击改变大小",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
