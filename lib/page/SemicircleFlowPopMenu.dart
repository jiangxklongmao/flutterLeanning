import 'dart:math';

import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/12 15:54
///    desc   :
///    version: 1.0
class SemicircleFlowPopMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SemicircleFlowPopMenuState();
  }
}

class SemicircleFlowPopMenuState extends State<SemicircleFlowPopMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _animation = Tween(begin: 0.0, end: 80.0).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlowPopMenu"),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Flow(
                delegate: SemicircleFlowMenuDelegate(radius: _animation.value),
                children: _buildMenuChildren(),
              ),
            ),
            Positioned.fill(
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _controller.status == AnimationStatus.completed
                        ? _controller.reverse()
                        : _controller.forward();
                  });
                },
              ),
            ),
          ],
        ));
  }

  //构建菜单控件
  List<Widget> _buildMenuChildren() {
    return List.generate(
        5,
        (index) => Container(
              child: Icon(
                index.isEven ? Icons.timer : Icons.ac_unit,
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ));
  }
}

class SemicircleFlowMenuDelegate extends FlowDelegate {
  final double radius; //绑定半径，让圆动起来

  SemicircleFlowMenuDelegate({this.radius});

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius <= 0) {
      return;
    }
    //起始位置(0,0)在父组件中心
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1));
      y = radius * sin(i * pi / (context.childCount - 1));
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant SemicircleFlowMenuDelegate oldDelegate) {
    return true;
  }
}
