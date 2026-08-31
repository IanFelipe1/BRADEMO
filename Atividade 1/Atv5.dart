//Escreva um programa de cadastro de residências em um portal
//de vendas em Dart. Para tal, siga as instruções a seguir:
//• Crie uma classe House com as propriedades int id, String name e double
//price;
//• Implemente um construtor que utilize o this para inicializar os atributos.
//• Solicite ao usuário que digite os dados (id, name e price) de 3 casas;
//• Crie os objetos da classe com os dados informados e adicione-os a uma
//lista;
//• Após a criação, use cascade notation (..) para alterar o nome de cada
//casa, adicionando o sufixo "(Cadastrada)".
//• Use um for-in para imprimir todos os detalhes das casas cadastradas.
//Dica: Use stdin.readLineSync() e lembre-se de converter os dados com
//int.parse() e double.parse()
import 'dart:io';

class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);
}

void main() {
  List<House> casas = [];

  print("Você vai digitar as informações de 3 casas");

  for (int i = 1; i <= 3; i++) {
    print("\nDigite o ID da casa $i:");
    int id = int.parse(stdin.readLineSync()!);

    print("Digite o nome da casa $i:");
    String name = stdin.readLineSync()!;

    print("Digite o preço da casa $i:");
    double price = double.parse(stdin.readLineSync()!);

    House casa = House(id, name, price);

    casas.add(casa);
  }

  
  for (House casa in casas) {
    casa..name = "${casa.name} (Cadastrada)";
  }

  print("\nCASAS CADASTRADAS");

  for (House casa in casas) {
    print(
      "ID: ${casa.id}\n"
      "Nome: ${casa.name}\n"
      "Preço: ${casa.price} reais\n",
    );
  }
}
