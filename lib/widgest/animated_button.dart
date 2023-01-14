import 'package:flutter/material.dart';
import 'package:toggkey/constants/colors.dart';
import 'package:toggkey/lock_state.dart';
import 'package:toggkey/main.dart';
import 'package:toggkey/widgest/use_guid_locked.dart';
import 'package:toggkey/widgest/user_guid_unlocked.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController buttonAnimationController;
  late final Animation<Alignment> buttonAnimation;

  @override
  void initState() {
    super.initState();
    buttonAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    buttonAnimation = CurvedAnimation(
            parent: buttonAnimationController, curve: Curves.easeInOut)
        .drive(AlignmentTween(
            begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: oltu.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(10, 5),
          ),
        ],
        gradient: const RadialGradient(
          focalRadius: 0.5,
          radius: 1.2,
          colors: [kula, oltu],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        width: 110,
        height: 240,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: oltu,
        ),
        child: ValueListenableBuilder<LockState>(
            valueListenable: lockStateNotiifer,
            builder: (context, lockState, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  if (lockState == LockState.locked) const
                  UserGuidLocked(),
                  if (lockState == LockState.unlocked) const 
                  UserGuidUnlocked(),
                  AnimatedBuilder(
                      animation: buttonAnimationController,
                      builder: (context, _) {
                        return Align(
                          alignment: buttonAnimation.value,
                          child: GestureDetector(
                            onPanUpdate: (dragUpdateDetails) {
                              if (dragUpdateDetails.delta.dy > 0 &&
                                  lockState == LockState.unlocked) {
                                buttonAnimationController.forward();
                                Future.delayed(const Duration(seconds: 1), () {
                                  lockStateNotiifer.value = LockState.locked;
                                });
                              } else if (dragUpdateDetails.delta.dy < 0 &&
                                  lockState == LockState.locked) {
                                buttonAnimationController.reverse();
                                Future.delayed(const Duration(seconds: 1), () {
                                  lockStateNotiifer.value = LockState.unlocked;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: lockState == LockState.locked
                                      ? [red, redDark]
                                      : [blue, blueDark],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: lockState == LockState.locked
                                          ? red.withOpacity(0.2)
                                          : blue.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 10),
                                ],
                              ),
                              child: lockState == LockState.locked
                                  ? Image.asset("images/lock.png",
                                      width: 30, color: pamukkale)
                                  : Image.asset("images/key.png",
                                      width: 30, color: pamukkale),
                            ),
                          ),
                        );
                      }),
                ],
              );
            }),
      ),
    );
  }
}
