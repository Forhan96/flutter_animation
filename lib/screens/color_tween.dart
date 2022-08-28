import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/components/color_tween.dart';

class ColorTweenScreen extends StatelessWidget {
  const ColorTweenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Tween"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColorAnimation(
              begin: 100.0,
              end: 200.0,
            ),
            ColorAnimation(
              begin: 200.0,
              end: 100.0,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
