//Crie um programa em Dart que simule o cadastro de um funcionário em uma
//empresa. Para compor o programa, crie a função cadastrarFuncionario que deve
//receber dois parâmetros nomeados: String nome (obrigatório) e String? cargo
//(opcional). Imprima uma mensagem de boas-vindas, incluindo o cargo apenas se ele for
//informado.
//Exemplo de chamada: cadastrarFuncionario(nome: "Ana", cargo:
//"Analista") ou cadastrarFuncionario(nome: "Carlos").

void cadastrarFuncionario(String nome, String? cargo) {
  
  
    
    if(cargo != null){
      print("Nome: $nome,\nCargo: $cargo");
    }else{
      print("Nome:$nome");
    }
  

  }

void main(){
  
    cadastrarFuncionario( "Ana" , "Analista");
cadastrarFuncionario( "Carlos",null);


}



