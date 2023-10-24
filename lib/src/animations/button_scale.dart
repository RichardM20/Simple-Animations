import 'package:animations/src/utils/colors.dart';
import 'package:animations/src/utils/decorations.dart';
import 'package:flutter/material.dart';

class ButtonScaleAnimated extends StatefulWidget {
  const ButtonScaleAnimated({
    super.key,
    required this.textButton,
    required this.function,
  });
  final String textButton;
  final VoidCallback function;
  @override
  // ignore: library_private_types_in_public_api
  _ButtonScaleAnimatedState createState() => _ButtonScaleAnimatedState();
}

class _ButtonScaleAnimatedState extends State<ButtonScaleAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((value) => _controller.reverse());
          widget.function();
        },
        child: AnimatedContainer(
          width: size.width / 1,
          height: 50,
          duration: const Duration(milliseconds: 300),
          decoration: DecorationsApp.buttonDecoraration,
          child: Center(
            child: Text(
              widget.textButton,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
