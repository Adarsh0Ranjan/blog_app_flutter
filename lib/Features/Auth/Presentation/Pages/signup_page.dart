import 'package:blog_app_flutter/Core/Theme/app_pallete.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_gradient_button.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(hintText: 'Name', controller: nameController),
              const SizedBox(height: 15),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              AuthField(hintText: 'Password', controller: passwordController, isObscure: true),
              const SizedBox(height: 20),
              AuthGradientButton(text: 'Sign Up'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()
                      )
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign In",
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
