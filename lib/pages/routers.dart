import 'package:cidadao_activo/pages/home.dart';
import 'package:cidadao_activo/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        return snapshot.hasData ? const HomePage() : const LoginPage();
      },
    );
  }
}
