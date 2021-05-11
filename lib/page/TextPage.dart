import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/11 18:03
///    desc   :
///    version: 1.0
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue.withOpacity(0.3),
          child: Text(
            "data dataSource dataSource dataSource data data data data",
            textAlign: TextAlign.justify,
            maxLines: 1,
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
      ),
    );
  }
}
