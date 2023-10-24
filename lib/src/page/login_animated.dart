import 'package:animations/src/animations/betwen_animation.dart';
import 'package:animations/src/animations/button_done.dart';
import 'package:animations/src/animations/button_loading.dart';
import 'package:animations/src/animations/button_scale.dart';
import 'package:animations/src/animations/scale_animation.dart';
import 'package:animations/src/utils/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_login.dart';
import 'widgets/login_field.dart';

class LoginAnimated extends StatefulWidget {
  const LoginAnimated({super.key});

  @override
  State<LoginAnimated> createState() => _LoginAnimatedState();
}

class _LoginAnimatedState extends State<LoginAnimated> {
  TextEditingController userFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  bool loading = false;

  void signIn() {
    setState(
      () {
        loading = !loading;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleAnimationWidget(
                  widget: Image.asset(
                    'assets/icon-login.png',
                  ),
                  duration: 300,
                ),
                const SizedBox(height: 80),
                BetwenAnimationControled(
                  duration: 270,
                  childPass: LoginField(
                    hintText: '@username',
                    textEditingController: userFieldController,
                  ),
                  direction: 'left',
                ),
                const SizedBox(height: 20),
                BetwenAnimationControled(
                  duration: 300,
                  childPass: LoginField(
                    hintText: '*******',
                    textEditingController: passwordFieldController,
                    isPassword: true,
                  ),
                  direction: 'right',
                ),
                const SizedBox(height: 30),
                BetwenAnimationControled(
                  duration: 320,
                  childPass: LoadingButtonWidget(
                    isLoading: loading,
                    textButton: 'Sign In',
                    onTap: () => signIn(),
                  ),
                  direction: 'down',
                ),
              ],
            ),
          ),
          const LoginBottomwidget()
        ],
      ),
    );
  }
}
