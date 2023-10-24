import 'package:animations/src/utils/colors.dart';
import 'package:animations/src/utils/decorations.dart';
import 'package:flutter/material.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({
    super.key,
    required this.textButton,
    required this.isLoading,
    this.onTap,
  });
  final String textButton;
  final bool isLoading;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: isLoading == true ? 50 : size.width / 1,
        height: 50,
        duration: const Duration(milliseconds: 300),
        decoration: DecorationsApp.buttonDecoraration,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  backgroundColor: ColorsApp.greyW,
                  color: ColorsApp.secondary,
                  strokeWidth: 1.5,
                )
              : Text(
                  textButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
