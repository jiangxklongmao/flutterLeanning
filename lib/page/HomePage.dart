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
      appBar: AppBar(
        title: Text("FlutterLearning"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "TextPage");
                  },
                  child: Text("TextPage"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "FlowPopMenu");
                  },
                  child: Text("FlowPopMenu"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "SemicircleFlowPopMenu");
                  },
                  child: Text("SemicircleFlowPopMenu"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "WeightWidget");
                  },
                  child: Text("WeightWidget"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "CustomScrollerBar");
                  },
                  child: Text("CustomScrollerBar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
