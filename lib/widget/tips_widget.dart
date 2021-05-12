import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/2/20 12:14
///    desc   : 提示文案通用样式
///    version: 1.0

void showTips(BuildContext context, String tips, {Duration duration}) {
  ScaffoldMessenger.maybeOf(context).removeCurrentSnackBar();
  ScaffoldMessenger.maybeOf(context).showSnackBar(SnackBar(
    backgroundColor: Colors.cyan,
    content: Text(
      tips,
      style: TextStyle(color: Colors.white),
    ),
    duration: duration != null ? duration : Duration(seconds: 2),
  ));
}
