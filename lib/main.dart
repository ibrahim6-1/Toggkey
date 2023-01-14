import 'package:flutter/material.dart';
import 'package:toggkey/lock_state.dart';
import 'package:toggkey/widgest/animated_button.dart';
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

ValueNotifier<LockState> lockStateNotiifer =ValueNotifier(LockState.unlocked);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const[
                        Icon(Icons.wifi, color: blue),
                        SizedBox(width: 11),
                        Text("Wifi Togg",
                        style: TextStyle(
                          color: pamukkale,
                        ),)
                      ],
                    ),
                    Image.asset("images/togg.png", height: 60),
                    const AnimatedButton(),
                    ValueListenableBuilder(
                      valueListenable: lockStateNotiifer,
                      builder: (context, lockState, _) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                            color: oltu,
                          ),
                          child: Text(lockState.value),
                        );
                      }
                    ),                  
                    ],
                ),
              ),
    
            ),
          ],
        ),
      ),
    );
  }
}
