import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/12 14:53
///    desc   : 实现水平展开/收起菜单
///    version: 1.0
class FlowPopMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlowPopMenuState();
  }
}

class FlowPopMenuState extends State<FlowPopMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  IconData lastTapped = Icons.notifications;

  final List<IconData> menuItems = [
    //菜单的Icons
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlowPopMenu"),
      ),
      body: Center(
        child: Flow(
          delegate: FlowMenuDelegate(animation: _controller),
          children: menuItems.map((e) => _buildFlowMenuItem(e)).toList(),
        ),
      ),
    );
  }

  //构建菜单
  Widget _buildFlowMenuItem(IconData iconData) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: EdgeInsets.all(8),
      child: RawMaterialButton(
        fillColor: lastTapped == iconData ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(iconData);
        },
        child: Icon(
          iconData,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  //更新菜单状态
  void _updateMenu(IconData iconData) {
    if (iconData != Icons.menu) {
      setState(() {
        lastTapped = iconData;
      });
    } else {
      _controller.status == AnimationStatus.completed
          ? _controller.reverse()
          : _controller.forward();
    }
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> animation;

  FlowMenuDelegate({this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 50.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; i++) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
