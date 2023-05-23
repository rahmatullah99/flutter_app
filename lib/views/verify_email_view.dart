import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_view.dart';
import 'package:flutter_app/views/register_view.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text('Email verification'),
          TextButton(
              onPressed: (() async {
                final user = FirebaseAuth.instance.currentUser;
                user?.sendEmailVerification;
              }),
              child: const Text('Send email'))
        ],
      ),
    );
  }
}
