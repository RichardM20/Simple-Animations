import 'package:animations/src/animations/scale_animation.dart';
import 'package:animations/src/utils/colors.dart';
import 'package:animations/src/utils/decorations.dart';
import 'package:flutter/material.dart';

class ButtonDoneAnimated extends StatefulWidget {
  const ButtonDoneAnimated({super.key});

  @override
  _ButtonDoneAnimatedState createState() => _ButtonDoneAnimatedState();
}

class _ButtonDoneAnimatedState extends State<ButtonDoneAnimated> with SingleTickerProviderStateMixin {
  bool isLoading = false;
  bool isDone = false;

  void _startLoading() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        isDone = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isDone = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (!isLoading && !isDone) {
          _startLoading();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        width: isDone ? 60 : (!isLoading ? size.width / 1 : 50),
        height: 50,
        alignment: Alignment.center,
        decoration: DecorationsApp.buttonDecoraration,
        child: isDone
            ? const ScaleAnimationWidget(
                widget: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                duration: 300,
              )
            : isLoading
                ? CircularProgressIndicator(
                    backgroundColor: ColorsApp.greyW,
                    color: ColorsApp.secondary,
                    strokeWidth: 1.5,
                  )
                : const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      ),
    );
  }
}
