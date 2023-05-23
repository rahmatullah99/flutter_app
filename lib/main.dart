import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_view.dart';
import 'package:flutter_app/views/register_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Register',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  final user = FirebaseAuth.instance.currentUser;
                  print(user);
                  return const LoginView();
                // final user = FirebaseAuth.instance.currentUser;
                // if (user?.emailVerified ?? false) {
                //   print("user verified");
                //   return const Text("User is verified");
                // } else {
                //   print("user not verified");
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => const VerifyEmailView()));
                //   });
                //   return const Text("User is not verified");
                // }

                default:
                  return const Text("Loading");
              }
            }));
  }
}

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
