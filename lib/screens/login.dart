import 'package:flutter/material.dart';
import 'package:zoom_clone/resoures/authmethod.dart';
import 'package:zoom_clone/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start and Join Meetings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          customButton(
              text: 'Login With Google',
              onPressed: () async {
                bool res = await _authMethods.siginInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/home');
                }
              })
        ],
      ),
    );
  }
}
