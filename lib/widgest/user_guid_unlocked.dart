import 'package:flutter/material.dart';
import 'package:toggkey/constants/colors.dart';
import 'package:toggkey/widgest/arrow_down.dart';

class UserGuidUnlocked extends StatelessWidget {
  const UserGuidUnlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: [
          // const ArrowDown(),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: anadolu.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Image.asset("images/lock.png",width: 30,color: anadolu),
          ),
          
        ],
      ),
    );
  }
}
