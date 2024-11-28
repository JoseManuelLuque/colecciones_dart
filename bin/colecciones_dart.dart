import 'dart:io';
import 'package:colecciones_dart/Ejercicio1.dart';
import 'package:colecciones_dart/ejercicio2.dart';
import 'package:colecciones_dart/ejercicio3.dart';

void main(List<String> arguments) {
  while (true) {
    String? opcion = menuPrincipal();

    switch (opcion) {
      case '1':
        print("\nEjecutando Ejercicio 1...");
        ejercicio1(); // Llama a la función del Ejercicio 1
        break;
      case '2':
        print("\nEjecutando Ejercicio 2...");
        ejercicio2(); // Llama a la función del Ejercicio 2
        break;
      case '3':
        print("\nEjecutando Ejercicio 3...");
        ejercicio3(); // Llama a la función del Ejercicio 3
        break;
      case '4':
        print("Saliendo del programa...");
        return; // Finaliza el programa
      default:
        print("Opción no válida. Por favor, intenta de nuevo.");
    }
  }
}

String? menuPrincipal() {
  print("\n=== Menú Principal ===");
  print("1. Ejecutar Ejercicio 1");
  print("2. Ejecutar Ejercicio 2");
  print("3. Ejecutar Ejercicio 3");
  print("4. Salir");

  stdout.write("Elige una opción: ");
  String? opcion = stdin.readLineSync();
  return opcion;
}
