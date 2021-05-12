import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/12 17:56
///    desc   : 自定义滚动条
///    version: 1.0
class CustomScrollbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomScrollbarState();
  }
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  double _alignmentY = 0;

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');

    _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomScrollerBar"),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Text('$index'),
                    ),
                  );
                },
                itemCount: 100,
                itemExtent: 80,
              ),
              //滚动条
              Container(
                alignment: Alignment(1, _alignmentY),
                padding: EdgeInsets.only(right: 5),
                child: _ScrollBar(),
              )
            ],
          ),
        ));
  }
}

class _ScrollBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_drop_up,
            size: 18,
            color: Colors.white,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
