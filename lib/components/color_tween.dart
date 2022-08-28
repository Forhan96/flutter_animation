import 'package:flutter/material.dart';

class ColorAnimation extends StatefulWidget {
  final double begin;
  final double end;

  const ColorAnimation({
    Key? key,
    required this.begin,
    required this.end,
  }) : super(key: key);

  @override
  State<ColorAnimation> createState() => _ColorAnimationState();
}

class _ColorAnimationState extends State<ColorAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _sizeAnimation = Tween<double>(begin: widget.begin, end: widget.end).animate(_animationController);
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    // _animationController.forward();
    return Container(
      height: _sizeAnimation.value,
      width: _sizeAnimation.value,
      color: _colorAnimation.value,
    );
  }
}
