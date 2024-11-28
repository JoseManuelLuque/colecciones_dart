// ignore_for_file: file_names

/*

Estás desarrollando una aplicación para gestionar géneros musicales favoritos. El
usuario puede añadir géneros a su lista, pero hay restricciones. Primero, no puede
añadir géneros duplicados. Segundo, el usuario solo puede tener un máximo de 5
géneros favoritos. Si intenta añadir un sexto género, se debe mostrar un mensaje de
error

*/
import 'dart:io';

void ejercicio1() {
//Definimos la lista de los género con uno por defecto
  var generosFavoritos = <String?>["Pop"];

  
  while(true){

    var opcion = menu();

    switch (opcion) {
        case '1':
          addGenero(generosFavoritos);
          break;
        case '2':
          imprimirLista(generosFavoritos);
          break;
        case '3':
          print("Saliendo...");
          return; // Sale del programa
        default:
          print("Opción no válida. Inténtalo de nuevo.");
      }
    }
}



String? menu() {
print("\nMenú:");
    print("1. Añadir un género");
    print("2. Mostrar lista de géneros");
    print("3. Salir");
    stdout.write("Elige una opción: ");
    String? opcion = stdin.readLineSync();
    return opcion;

}

void addGenero(generosFavoritos) {
  if (generosFavoritos.length >= 5) {
    print("No puedes añadir más de 5 géneros a tu lista de favoritos.");
    return;
  }

  print("Desea añadir un genero a su lista de favoritos");
  String? genero = stdin.readLineSync();
  if (genero != null && genero.isNotEmpty) {
    print("Genero: $genero añadido correctamente!");
    generosFavoritos.add(genero);
  } else {
    print("No ingresaste ningún genro.");
  }
}



void imprimirLista(generosFavoritos) {
  if (generosFavoritos.isEmpty) {
    print("Tu lista de géneros favoritos está vacía.");
  } else {
    print("Lista de géneros favoritos:");
    for (var genero in generosFavoritos) {
      print("- $genero");
    }
  }
}
