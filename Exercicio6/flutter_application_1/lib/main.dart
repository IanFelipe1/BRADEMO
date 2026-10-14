import 'package:flutter/material.dart';

void main() {
  runApp(const AppTarefas());
}

class AppTarefas extends StatelessWidget {
  const AppTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Tarefas',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const PaginaTarefas(),
    );
  }
}

class Tarefa {
  final String titulo;
  final String horario;
  bool concluida;

  Tarefa({
    required this.titulo,
    required this.horario,
    this.concluida = false,
  });
}

class PaginaTarefas extends StatefulWidget {
  const PaginaTarefas({super.key});

  @override
  State<PaginaTarefas> createState() => _PaginaTarefasState();
}

class _PaginaTarefasState extends State<PaginaTarefas> {
  bool visualizarConcluidas = false;

  final List<Tarefa> tarefas = [
    Tarefa(
      titulo: 'Task 2022-07-09',
      horario: '18:08:31.734244',
    ),
    Tarefa(
      titulo: 'Task 2022-07-09',
      horario: '18:08:32.210300',
    ),
    Tarefa(
      titulo: 'Task 2022-07-09',
      horario: '18:08:32.629026',
    ),
    Tarefa(
      titulo: 'Task 2022-07-09',
      horario: '18:08:33.073472',
    ),
    Tarefa(
      titulo: 'Task 2022-07-09',
      horario: '18:08:33.524172',
    ),
  ];

  List<Tarefa> get tarefasVisiveis {
    return tarefas.where((tarefa) {
      return tarefa.concluida == visualizarConcluidas;
    }).toList();
  }

  int get tarefasPendentes {
    return tarefas.where((tarefa) => !tarefa.concluida).length;
  }

  void mostrarAlerta() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('App de Notas'),
          content: const Text(
            'Você está no App de Notas de Tarefas',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kindacode.com'),
        centerTitle: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    visualizarConcluidas = !visualizarConcluidas;
                  });
                },
                child: Text(
                  visualizarConcluidas
                      ? 'View Uncompleted Tasks'
                      : 'View Completed Tasks',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Text(
                'You have $tarefasPendentes uncompleted tasks',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: tarefasVisiveis.isEmpty
                  ? const Center(
                      child: Text('Nenhuma tarefa nesta lista.'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        12,
                        0,
                        12,
                        16,
                      ),
                      itemCount: tarefasVisiveis.length,
                      itemBuilder: (context, index) {
                        final tarefa = tarefasVisiveis[index];

                        return Card(
                          color: Colors.amber,
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tarefa.titulo,
                                        style: TextStyle(
                                          fontSize: 15,
                                          decoration: tarefa.concluida
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        tarefa.horario,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                  value: tarefa.concluida,
                                  onChanged: (valor) {
                                    setState(() {
                                      tarefa.concluida = valor ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mostrarAlerta,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}