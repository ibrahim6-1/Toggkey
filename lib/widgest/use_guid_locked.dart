import 'package:flutter/material.dart';
import 'package:toggkey/constants/colors.dart';
import 'package:toggkey/widgest/arrow_up.dart';

class UserGuidLocked extends StatelessWidget {
  const UserGuidLocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: blue.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Image.asset(
              "images/key.png",
              width: 30,
              color: blue,
            ),
          ),
          const SizedBox(height: 10),
          // ArrowUp(),
        ],
      ),
    );
  }
}
