import 'package:blog_app_flutter/Core/Theme/app_pallete.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/Pages/signup_page.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              AuthField(hintText: 'Password', controller: passwordController, isObscure: true),
              const SizedBox(height: 20),
              AuthGradientButton(text: 'Sign In', onPressed: () {

              }),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => const SignupPage()
                     )
                 );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient1,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
