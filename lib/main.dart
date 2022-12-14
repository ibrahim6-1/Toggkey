import 'package:flutter/material.dart';
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
        color: gemlik,
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
        ],
      ),
    );
  }
}
