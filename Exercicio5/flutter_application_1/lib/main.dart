import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Flutuante',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  bool menuAberto = false;
  int paginaSelecionada = 0;

  final List<String> paginas = [
    'Início',
    'Favoritos',
    'Notificações',
    'Perfil',
  ];

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );

    setState(() {
      menuAberto = false;
    });
  }

  Widget botaoAcao({
    required IconData icone,
    required String texto,
    required VoidCallback aoPressionar,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: FloatingActionButton.small(
        heroTag: texto,
        onPressed: aoPressionar,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(icone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Flutuante'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          paginas[paginaSelecionada],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: menuAberto
                ? Column(
                    key: const ValueKey('menuAberto'),
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      botaoAcao(
                        icone: Icons.phone,
                        texto: 'Telefone',
                        aoPressionar: () {
                          mostrarMensagem(
                            'Opção Telefone selecionada',
                          );
                        },
                      ),
                      botaoAcao(
                        icone: Icons.email,
                        texto: 'E-mail',
                        aoPressionar: () {
                          mostrarMensagem(
                            'Opção E-mail selecionada',
                          );
                        },
                      ),
                      botaoAcao(
                        icone: Icons.message,
                        texto: 'Mensagem',
                        aoPressionar: () {
                          mostrarMensagem(
                            'Opção Mensagem selecionada',
                          );
                        },
                      ),
                    ],
                  )
                : const SizedBox(
                    key: ValueKey('menuFechado'),
                  ),
          ),
          FloatingActionButton(
            heroTag: 'botaoPrincipal',
            onPressed: () {
              setState(() {
                menuAberto = !menuAberto;
              });
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            child: Icon(
              menuAberto ? Icons.close : Icons.add,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 65,
        color: Colors.white,
        child: Row(
          children: [
            itemNavegacao(
              icone: Icons.home,
              texto: 'Início',
              indice: 0,
            ),
            itemNavegacao(
              icone: Icons.favorite,
              texto: 'Favoritos',
              indice: 1,
            ),
            const SizedBox(width: 48),
            itemNavegacao(
              icone: Icons.notifications,
              texto: 'Avisos',
              indice: 2,
            ),
            itemNavegacao(
              icone: Icons.person,
              texto: 'Perfil',
              indice: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemNavegacao({
    required IconData icone,
    required String texto,
    required int indice,
  }) {
    final selecionado = paginaSelecionada == indice;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            paginaSelecionada = indice;
            menuAberto = false;
          });
        },
        child: SizedBox(
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icone,
                color: selecionado ? Colors.blue : Colors.grey,
              ),
              Text(
                texto,
                style: TextStyle(
                  fontSize: 10,
                  color: selecionado ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
