import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post(this.userId, this.id, this.title, this.body);
  String toJson() {
    // Necessário converter para Map<String, dynamic>
    Map<String, dynamic> input = {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body,
    };
    // Converte para JSON
    return jsonEncode(input);
  }

  static Post fromJson(String jsonSource) {
    // Converte para Map<String, dynamic>
    Map<String, dynamic> item = jsonDecode(jsonSource);
    // Cria um Post de um JSON
    return Post(item['userId'], item['id'], item['title'], item['body']);
  }
}