//Utilizando a classe Laptop do exercício anterior, crie 3 named
//constructors. Cada um deve criar uma instância de Laptop que configure:
//• um laptop para somente navegação na internet;
//• um laptop para uso em escritório;
//• um laptop para programação.
//Você deve decidir quais configurações serão definidas em cada named
//constructor. Por fim, crie instâncias de objetos Laptop utilizando cada um dos
//named constructor e imprima seus valores no console.
class Laptop {
  int id;
  String nome;
  String ram;
  String clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);
  Laptop.navegacao()
      : id = 1,
        nome = "Laptop para Navegação",
        ram = "4GB",
        clockCpu = "3.1GHz";

  Laptop.escritorio()
      : id = 2,
        nome = "Laptop para Escritório",
        ram = "8GB",
        clockCpu = "3.5GHz";

  Laptop.programacao()
      : id = 3,
        nome = "Laptop para Programação",
        ram = "16GB",
        clockCpu = "4.1GHz";
}
void main() {
  Laptop laptopNavegacao = Laptop.navegacao();
  Laptop laptopEscritorio = Laptop.escritorio();
  Laptop laptopProgramacao = Laptop.programacao();

  print("Navegação\nID: ${laptopNavegacao.id}\nNome: ${laptopNavegacao.nome}\nRAM: ${laptopNavegacao.ram}\nClock CPU: ${laptopNavegacao.clockCpu}\n");
  print("Escritório\nID: ${laptopEscritorio.id}\nNome: ${laptopEscritorio.nome}\nRAM: ${laptopEscritorio.ram}\nClock CPU: ${laptopEscritorio.clockCpu}\n");
  print("Programação\nID: ${laptopProgramacao.id}\nNome: ${laptopProgramacao.nome}\nRAM: ${laptopProgramacao.ram}\nClock CPU: ${laptopProgramacao.clockCpu}");
}