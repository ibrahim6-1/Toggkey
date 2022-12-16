import 'package:flutter/material.dart';
import 'package:toggkey/widgest/arrow_down.dart';

class UserGuidUnlocked extends StatelessWidget {
  const UserGuidUnlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: const[
          ArrowDown(),
        ],
      ),
    );
  }
}
