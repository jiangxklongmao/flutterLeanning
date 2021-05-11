import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/11 17:57
///    desc   :
///    version: 1.0
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "TextPage");
              },
              child: Text("TextPage"),
            )
          ],
        ),
      ),
    ));
  }
}
