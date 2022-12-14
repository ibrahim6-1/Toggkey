import 'package:flutter/material.dart';
import 'package:toggkey/widgest/bg_clipper.dart';
import 'package:toggkey/widgest/bottom_navbar.dart';

import 'constants/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: BottomNavbar(),
        color: oltu,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                colors: [gemlik, oltu],
              ),
            ),
          ),
          ClipPath(
            clipper: BgClipper(),
            child: Container(
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gemlik, oltu],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
