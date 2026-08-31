//Crie um programa em Dart para um sistema de cadastro de equipamentos do
//IFSP. Use `var` para declarar o nome do equipamento como "Impressora 3D", `String`
//para o local como "Lab de Protótipos", e `dynamic` para o número de patrimônio,
//inicialmente como `12345`. Em seguida, altere o valor de `patrimonio` para `"12345-A"`
//(simulando uma mudança de formato). Por fim, imprima os valores e use o operador `is`
//para mostrar o tipo atual de cada variável. Use comentários no código para explicar por que
//Dart permite mudar o tipo de patrimonio, mas não de local

void main() {
  var equipamento = "Impressora 3D";

  // Tipo String define que a variavél só pode receber textos
  String local = "Lab de Protótipos";

  // Tipo dynamic permite alteração dos valores para outros formatos
  dynamic patrimonio = 12345;

  // Foi possivel alterar o tipo de patrimonio porque ela foi declarada como dynamic
  patrimonio = "12345-A";

  print(equipamento);
  print(local);
  print(patrimonio);

  print(equipamento is String);
  print( local is String);
  print( patrimonio is String);
}