//Escreva um programa em Dart para criar uma classe Laptop
//com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
//imprimindo todos os detalhes.

class Laptop{
  int id;
  String nome;
  String ram;
  String clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);
}

void main(){
  Laptop laptop1 = Laptop(1, "Positivo", "4GB", "3.5GHz");
  Laptop laptop2 = Laptop(2, "Dell", "8GB", "4.1GHz");
  Laptop laptop3 = Laptop(3, "Lenovo", "16GB", "4.3GHz");

  print("Laptop 1\nID: ${laptop1.id}\nNome: ${laptop1.nome}\nRAM: ${laptop1.ram}\nClock CPU: ${laptop1.clockCpu}\n");
  print("Laptop 2\nID: ${laptop2.id}\nNome: ${laptop2.nome}\nRAM: ${laptop2.ram}\nClock CPU: ${laptop2.clockCpu}\n");
  print("Laptop 3\nID: ${laptop3.id}\nNome: ${laptop3.nome}\nRAM: ${laptop3.ram}\nClock CPU: ${laptop3.clockCpu}");
}