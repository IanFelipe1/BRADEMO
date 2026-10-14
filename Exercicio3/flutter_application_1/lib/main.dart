import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutApp());
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restrições de Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const LayoutScreen(),
    );
  }
}

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int exemploAtual = 0;

  final List<String> titulos = [
    'Container',
    'Center',
    'Row e Expanded',
    'ConstrainedBox',
  ];

  final List<String> explicacoes = [
    'O Container vermelho ocupa toda a área disponível. '
        'O tamanho final depende das restrições recebidas do widget pai.',

    'O Center ocupa o espaço disponível e posiciona '
        'o quadrado vermelho no centro, respeitando seu tamanho definido.',

    'O Row organiza os blocos horizontalmente. '
        'Com Expanded, cada bloco recebe uma parte igual da largura disponível.',

    'O ConstrainedBox define limites para o tamanho do quadrado. '
        'Neste exemplo, ele pode ter entre 100 e 180 pixels.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restrições de Layout'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Exemplo ${exemploAtual + 1}: '
                '${titulos[exemploAtual]}',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _construirExemplo(),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                explicacoes[exemploAtual],
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  titulos.length,
                  (index) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exemploAtual = index;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: exemploAtual == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                        foregroundColor: exemploAtual == index
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: Text('${index + 1}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirExemplo() {
    switch (exemploAtual) {
      case 0:
        return Container(
          color: Colors.red,
        );

      case 1:
        return const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
        );

      case 2:
        return Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  'Bloco A',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  'Bloco B',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );

      case 3:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 100,
              maxWidth: 180,
              maxHeight: 180,
            ),
            child: Container(
              width: 140,
              height: 140,
              color: Colors.red,
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}