/*

Estás desarrollando una aplicación básica de tareas donde los usuarios pueden
agregar y ver tareas que necesitan hacer. La lista de tareas se muestra de forma
secuencial y el usuario puede verlas en el orden en que las agregó.

*/
import 'dart:io';

void ejercicio2() {
	var listaTareas = <String>[];

	while(true){

    var opcion = menu();

    switch (opcion) {
        case '1':
          addTarea(listaTareas);
          break;
        case '2':
          imprimirLista(listaTareas);
          break;
		case '3':
          eliminarTarea(listaTareas);
          break;
        case '4':
          print("Saliendo...");
          return; // Sale del programa
        default:
          print("Opción no válida. Inténtalo de nuevo.");
      }
    }

}

String? menu() {

	print("Menú:");
    print("1. Agregar nueva tarea");
    print("2. Mostrar lista de tareas");
	print("3. Eliminar tarea de la lista");
    print("4. Salir");

    stdout.write("Elige una opción: ");

    String? opcion = stdin.readLineSync();
    return opcion;

}

void imprimirLista(listaTareas) {
  if (listaTareas.isEmpty) {

    print("Tu lista de tareas está vacía.");

  } else {

    print("Lista de tareas:");

	int contador = 1; 

    for (var tarea in listaTareas) {
      print("$contador - $tarea");
	  contador ++;
    }
  }
}

void addTarea(listaTareas) {

  print("Añada la tarea a la lista: ");
  String? tarea = stdin.readLineSync();

  if (tarea != null && tarea.isNotEmpty) {

    print("Tarea: $tarea añadida correctamente!");
    listaTareas.add(tarea);

  } else {

    print("Error al agregar tarea.");

  }
}
void eliminarTarea(listaTareas) {
if (listaTareas.isEmpty) {
    print("\nTu lista de tareas ya está vacía.");
    return;
  }

  imprimirLista(listaTareas);

  stdout.write("\n¿Qué tarea has acabado? Introduce el número de la tarea: ");
  String? entrada = stdin.readLineSync();

  if (entrada != null && int.tryParse(entrada) != null) {
    int indice = int.parse(entrada) - 1;

    if (indice >= 0 && indice < listaTareas.length) {
      String tareaEliminada = listaTareas.removeAt(indice);
      print("Tarea '$tareaEliminada' eliminada correctamente.");
    } else {
      print("Número inválido. Por favor, elige un número válido.");
    }
  } else {
    print("Entrada inválida. Por favor, introduce un número.");
  }
}