import 'package:flutter/material.dart';
import '../models/login.dart';
import '../screens/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usuarioController =
      TextEditingController();
  final TextEditingController senhaController =
      TextEditingController();

  void realizarLogin() {
    final login = Login(
      usuario: usuarioController.text,
      senha: senhaController.text,
    );

    if (login.usuario == 'admin' && login.senha == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha no login. Verifique usuário e senha.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: usuarioController,
          decoration: const InputDecoration(
            labelText: 'Usuário',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: senhaController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: realizarLogin,
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
