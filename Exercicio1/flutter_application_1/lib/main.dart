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
      title: 'Galeria de destinos',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GaleriaScreen(),
    );
  }
}

class Destino {
  final String titulo;
  final String descricao;
  final String imagem;

  const Destino({
    required this.titulo,
    required this.descricao,
    required this.imagem,
  });
}

class GaleriaScreen extends StatelessWidget {
  const GaleriaScreen({super.key});

  final List<Destino> destinos = const [
    Destino(
      titulo: 'Canada',
      descricao: 'Montanhas',
      imagem:
          'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600',
    ),
    Destino(
      titulo: 'Caribe',
      descricao: 'Sol e tranquilidade',
      imagem:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600',
    ),
    Destino(
      titulo: 'Alemanha',
      descricao: 'A beleza do verde',
      imagem:
          'https://images.unsplash.com/photo-1448375240586-882707db888b?w=600',
    ),
    Destino(
      titulo: 'Nova York',
      descricao: 'Arquitetura urbana',
      imagem:
          'https://images.unsplash.com/photo-1519501025264-65ba15a82390?w=600',
    ),
    Destino(
      titulo: 'Suecia',
      descricao: 'Paisagens serenas',
      imagem:
          'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=600',
    ),
    Destino(
      titulo: 'Arizona',
      descricao: 'Deserto e cânions',
      imagem:
          'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de destinos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: destinos.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final destino = destinos[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    destino.imagem,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const ColoredBox(
                        color: Colors.black12,
                        child: Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            destino.titulo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            destino.descricao,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}