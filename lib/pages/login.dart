import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onLogin});

  final void Function(User? user) onLogin;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    widget.onLogin(userCredential.user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    widget.onLogin(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value) => email = value,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) => password = value,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  signInWithEmailAndPassword(email, password);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
