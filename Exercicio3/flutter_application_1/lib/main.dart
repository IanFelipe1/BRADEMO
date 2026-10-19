
import 'dart:convert';

import 'package:flutter/material.dart';
import 'post.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: PostWidget()
  ));
}

class PostWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return PostWidgetState();
  }
}

class PostWidgetState extends State<PostWidget>{
  Post post = Post(0, 0, "title", "body");

  @override
  void initState() {
    super.initState();
    getPost();
  }

  Future<void> getPost() async{
    final url = Uri.https(
                  'jsonplaceholder.typicode.com',
                  'posts/3'
                );
    final response = await http.get(url,
                    headers: {
                      "Content-type":
                      "application/json"
                    }
                  );
    post = Post
            .fromJson(response.body);
    setState(() {

    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${post.id}"),
            Text("${post.title}"),
          ],
        ),
      ),

      // acesso à tela com as operações HTTP
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostOperationsPage(),
            ),
          );
        },
        icon: Icon(Icons.http),
        label: Text('Operações HTTP'),
      ),
    );
  }
}

// tela para as operações HTTP

class PostOperationsPage extends StatefulWidget {
  @override
  State<PostOperationsPage> createState() =>
      PostOperationsPageState();
}

class PostOperationsPageState extends State<PostOperationsPage> {
  final TextEditingController idController =
      TextEditingController(text: '3');

  final TextEditingController userIdController =
      TextEditingController(text: '1');

  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController bodyController =
      TextEditingController();

  List<Post> posts = [];

  bool loading = false;

  String message = 'Selecione uma operação.';

  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Uri postUrl([int? id]) {
    return Uri.https(
      'jsonplaceholder.typicode.com',
      id == null ? 'posts' : 'posts/$id',
    );
  }

  int readId() {
    final id = int.tryParse(idController.text.trim());

    if (id == null || id <= 0) {
      throw Exception('Informe um ID de post válido.');
    }

    return id;
  }

  int readUserId() {
    final userId = int.tryParse(userIdController.text.trim());

    if (userId == null || userId <= 0) {
      throw Exception('Informe um ID de usuário válido.');
    }

    return userId;
  }

  void validateContent() {
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      throw Exception('Preencha o título e o conteúdo do post.');
    }
  }

  Future<void> executeRequest(
    Future<void> Function() request,
  ) async {
    if (loading) return;

    setState(() {
      loading = true;
      message = 'Executando requisição...';
    });

    try {
      await request();
    } catch (error) {
      if (mounted) {
        setState(() {
          message = 'Erro: $error';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  // GET recuperar um post pelo ID
  Future<void> getPostById() async {
    await executeRequest(() async {
      final id = readId();

      final response = await http.get(
        postUrl(id),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('GET falhou: HTTP ${response.statusCode}');
      }

      final post = Post.fromJson(response.body);

      if (!mounted) return;

      setState(() {
        posts = [post];
        idController.text = post.id.toString();
        userIdController.text = post.userId.toString();
        titleController.text = post.title;
        bodyController.text = post.body;
        message = 'GET realizado com sucesso.';
      });
    });
  }

  // GET recuperar a lista de posts
  Future<void> getPosts() async {
    await executeRequest(() async {
      final response = await http.get(
        postUrl(),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(
          'GET da lista falhou: HTTP ${response.statusCode}',
        );
      }

      final List<dynamic> data = jsonDecode(response.body);

      final List<Post> receivedPosts = data
          .map((item) => Post.fromJson(jsonEncode(item)))
          .toList();

      if (!mounted) return;

      setState(() {
        posts = receivedPosts;
        message = 'Lista recuperada: ${posts.length} posts.';
      });
    });
  }

  // POST criar um post
  Future<void> createPost() async {
    await executeRequest(() async {
      validateContent();

      final userId = readUserId();

      final response = await http.post(
        postUrl(),
        headers: headers,
        body: jsonEncode({
          'userId': userId,
          'title': titleController.text.trim(),
          'body': bodyController.text.trim(),
        }),
      );

      if (response.statusCode != 201 &&
          response.statusCode != 200) {
        throw Exception('POST falhou: HTTP ${response.statusCode}');
      }

      final createdPost = Post.fromJson(response.body);

      if (!mounted) return;

      setState(() {
        posts = [
          createdPost,
          ...posts.where((item) => item.id != createdPost.id),
        ];

        idController.text = createdPost.id.toString();
        message = 'POST realizado. ID retornado: ${createdPost.id}.';
      });
    });
  }

  //PUT atualizar um post
  Future<void> updatePost() async {
    await executeRequest(() async {
      validateContent();

      final id = readId();
      final userId = readUserId();

      final response = await http.put(
        postUrl(id),
        headers: headers,
        body: jsonEncode({
          'userId': userId,
          'id': id,
          'title': titleController.text.trim(),
          'body': bodyController.text.trim(),
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('PUT falhou: HTTP ${response.statusCode}');
      }

      final updatedPost = Post.fromJson(response.body);

      if (!mounted) return;

      setState(() {
        final index = posts.indexWhere((item) => item.id == id);

        if (index >= 0) {
          posts[index] = updatedPost;
        } else {
          posts.insert(0, updatedPost);
        }

        message = 'PUT realizado para o post $id.';
      });
    });
  }

  //DELETE excluir um post
  Future<void> deletePost() async {
    await executeRequest(() async {
      final id = readId();

      final response = await http.delete(
        postUrl(id),
        headers: headers,
      );

      if (response.statusCode != 200 &&
          response.statusCode != 204) {
        throw Exception(
          'DELETE falhou: HTTP ${response.statusCode}',
        );
      }

      if (!mounted) return;

      setState(() {
        posts.removeWhere((item) => item.id == id);
        message = 'DELETE realizado para o post $id.';
      });
    });
  }

  // Preencher os campos ao selecionar um post da lista
  void selectPost(Post post) {
    setState(() {
      idController.text = post.id.toString();
      userIdController.text = post.userId.toString();
      titleController.text = post.title;
      bodyController.text = post.body;
      message = 'Post ${post.id} selecionado.';
    });
  }

  @override
  void dispose() {
    idController.dispose();
    userIdController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operações HTTP'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'JSONPlaceholder - Posts',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ID do post',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: userIdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ID do usuário',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Título',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 12),

          TextField(
            controller: bodyController,
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Conteúdo',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),

          SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: loading ? null : getPostById,
                child: Text('GET por ID'),
              ),
              ElevatedButton(
                onPressed: loading ? null : getPosts,
                child: Text('GET lista'),
              ),
              ElevatedButton(
                onPressed: loading ? null : createPost,
                child: Text('POST'),
              ),
              ElevatedButton(
                onPressed: loading ? null : updatePost,
                child: Text('PUT'),
              ),
              ElevatedButton(
                onPressed: loading ? null : deletePost,
                child: Text('DELETE'),
              ),
            ],
          ),

          SizedBox(height: 16),

          if (loading) LinearProgressIndicator(),

          SizedBox(height: 12),

          Text(
            message,
            style: TextStyle(
              color: message.startsWith('Erro:')
                  ? Colors.red
                  : Colors.indigo,
            ),
          ),

          Divider(height: 32),

          Text(
            'Posts (${posts.length})',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          if (posts.isEmpty)
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Nenhum post carregado. '
                'Utilize GET por ID ou GET lista.',
                textAlign: TextAlign.center,
              ),
            ),

          ...posts.map(
            (post) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${post.id}'),
                ),
                title: Text(post.title),
                subtitle: Text(
                  'Usuário: ${post.userId}\n${post.body}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                isThreeLine: true,
                onTap: () => selectPost(post),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
