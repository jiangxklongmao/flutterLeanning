import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

///    author : xingke
///    e-mail : jxklongmao@gmail.com
///    date   : 2021/5/13 10:56
///    desc   :
///    version: 1.0
class GradientDemo extends StatelessWidget {
  const GradientDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gradient"),
      ),
      body: _buildCircleProgressPaint(),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "assets/images/scenery.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLinearGradient() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.red, Colors.green],
        ).createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: _buildImage(),
    );
  }

  Widget _buildRadialGradient() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(radius: 0.6, colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.grey.withOpacity(0.7),
          Colors.grey.withOpacity(0.7)
        ], stops: [
          0,
          0.5,
          0.5,
          1
        ]).createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: _buildImage(),
    );
  }

  Widget _buildSweepGradient() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return SweepGradient(
          colors: [Colors.blue, Colors.green],
        ).createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: _buildImage(),
    );
  }

  //绘制渐变圆环
  Widget _buildCircleProgressPaint() {
    return Container(
      padding: EdgeInsets.all(20),
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: _CircleProgressPaint(0.5),
      ),
    );
  }
}

class _CircleProgressPaint extends CustomPainter {
  final double progress;

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  _CircleProgressPaint(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.shader = ui.Gradient.sweep(
      Offset(size.width / 2, size.height / 2),
      [Colors.red, Colors.yellow],
      null,
      TileMode.clamp,
      0,
      progress * 2 * pi,
    );
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height),0,
        2 * pi, false, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
