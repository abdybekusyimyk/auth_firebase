import 'package:auth_firebase/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/text_form_field.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                controller: emailController,
                icon: const Icon(Icons.email),
                text: 'Email',
              ),
              AppTextFormField(
                controller: passController,
                icon: const Icon(Icons.password),
                text: 'Password',
              ),
              const SizedBox(height: 20),
              AppButton(
                text: 'Sign In',
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty) {
                    login(
                      context: context,
                      email: emailController.text,
                      password: passController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
