import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  final Widget child;
  final bool fadeIn;
  const Fade({Key? key, required this.child, this.fadeIn = true}) : super(key: key);

  @override
  State<Fade> createState() => _FadeState();
}

class _FadeState extends State<Fade> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    if (widget.fadeIn) {
      _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    } else {
      _animation = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
