import 'package:flutter/material.dart';

import '../../animations/betwen_animation.dart';

class LoginBottomwidget extends StatelessWidget {
  const LoginBottomwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BetwenAnimationControled(
              duration: 340,
              childPass: const Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              direction: 'left',
            ),
            BetwenAnimationControled(
              duration: 360,
              childPass: const Text(
                "Need Help?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              direction: 'right',
            ),
          ],
        ),
      ),
    );
  }
}
