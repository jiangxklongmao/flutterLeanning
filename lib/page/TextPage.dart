import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/widget/tips_widget.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/11 18:03
///    desc   :
///    version: 1.0
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text相关"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
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
            Padding(padding: EdgeInsets.only(top: 20)),
            Builder(builder: (BuildContext context) {
              RenderBox box = context.findRenderObject();
              final Shader linearGradient = LinearGradient(colors: <Color>[
                Colors.purple,
                Colors.blue,
                Colors.redAccent
              ]).createShader(
                  Rect.fromLTWH(0.0, 0.0, box?.size?.width, box?.size?.height));
              return Text(
                "国家博物馆倡导践行展览是最重要的服务产品、策展能力是核心能力等理念，着力打造包含基本陈列、专题展览和临时展览的新展览体系。",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 20)),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Text(
                        '判断题',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: '泡沫灭火器可用于带电灭火',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Text(
                        '判断题',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text.rich(
              TextSpan(
                  text: '登录即代表同意并阅读',
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey.withOpacity(0.9)),
                  children: [
                    TextSpan(
                        text: '<<服务协议>>',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('OnTap');
                            showTips(context, "服务协议");
                          })
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
