import 'package:cidadao_activo/pages/register.dart';
import 'package:cidadao_activo/pages/routers.dart';
import 'package:cidadao_activo/service/authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F8),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: Image.asset(
                        'assets/images/logo2.png',
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'C',
                          style: TextStyle(
                            color: Color(0xFF81E1D7),
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'App',
                          style: TextStyle(
                            color: Color(0xFFF1B49B),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 0,
                      left: 0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: TextField(
                            controller: _emailController,
                            decoration:
                                const InputDecoration(label: Text('Email')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: TextField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(label: Text('Senha')),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                _loginSubmit();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF81E1D7),
                              ),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Não tens uma conta?'),
                              TextButton(
                                child: const Text(
                                  'Registar',
                                  style: TextStyle(
                                    color: Color(0xFF81E1D7),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginSubmit() {
    String email = _emailController.text;
    String password = _passwordController.text;
    _authenticationService
        .login(email: email, password: password)
        .then((String? erro) {
      if (erro != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ocorreu um erro ao fazer Login!')),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário Logado com sucesso!')),
          );
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoteadorTela(),
          ),
        );
      }
    });
  }
}
