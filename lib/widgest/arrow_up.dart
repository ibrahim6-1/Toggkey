import 'dart:ffi';

import 'package:flutter/material.dart';

class ArrowUp extends StatefulWidget {
  const ArrowUp({super.key});

  @override
  State<ArrowUp> createState() => _ArrowUpState();
}

class _ArrowUpState extends State<ArrowUp> with SingleTickerProviderStateMixin {
  late AnimationController arrowAnimationController;
  late Animation<double> largeArrowOpacityAnimation;
  late Animation<double> mediumArrowOpacityAnimation;
  late Animation<double> smallArrowOpacityAnimation;

  @override
  void initState() {
    super.initState();
    arrowAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    largeArrowOpacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: arrowAnimationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn)));

    mediumArrowOpacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: arrowAnimationController,
        curve: Interval(0.25, 0.75, curve: Curves.easeIn)));

    smallArrowOpacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: arrowAnimationController,
        curve: Interval(0.75, 1.0, curve: Curves.easeIn))); 

    arrowAnimationController.repeat(reverse: false);
    arrowAnimationController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -5,
          child: Opacity(
            opacity: smallArrowOpacityAnimation.value,
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 20,
            ),
          ),
        ),
        Opacity(
          opacity: mediumArrowOpacityAnimation.value,
          child: Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 25,
          ),
        ),
        Positioned(
          bottom: -10,
          child: Opacity(
            opacity: largeArrowOpacityAnimation.value,
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
