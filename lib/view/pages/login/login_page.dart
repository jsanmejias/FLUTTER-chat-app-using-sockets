import 'package:flutter/material.dart';

import 'package:chat_app/view/pages/login/widgets/login_form.dart';

import 'package:chat_app/view/common/widgets/logo.dart';
import 'package:chat_app/view/common/widgets/labels.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: constraints.maxHeight * 1),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Logo(title: 'Login'),
                        LoginForm(),
                        Labels(isLoginPage: true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
