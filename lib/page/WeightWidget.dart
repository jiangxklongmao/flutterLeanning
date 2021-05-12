import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/12 17:05
///    desc   : 权重组件
///    version: 1.0
class WeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WeightWidget"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "宽固定100",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: 50,
                      child: Text(
                        "强制填满剩余",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    child: Text(
                      "宽固定100",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text(
                        "1/6",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 50,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        "2/6",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Text(
                        "3/6",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "宽固定100",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: 50,
                      child: Text(
                        "Expanded填满剩余",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    child: Text(
                      "宽固定100",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.redAccent,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.greenAccent,
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.blueAccent,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
