/*

Estás desarrollando una aplicación sencilla para gestionar las calificaciones de los
estudiantes. Para cada estudiante, se almacena su nombre y la calificación que ha
obtenido.

*/
import 'dart:io';

void ejercicio3() {
  Map<String, int> mapaCalificaciones = {}; // Mapa de nombre -> calificación.

  while (true) {
    String? opcion = menu();

    switch (opcion) {
      case '1':
        agregarCalificacion(mapaCalificaciones);
        break;
      case '2':
        mostrarCalificaciones(mapaCalificaciones);
        break;
      case '3':
        editarCalificacion(mapaCalificaciones);
        break;
      case '4':
        print("Saliendo del programa...");
        return;
      default:
        print("Opción no válida. Por favor, intenta de nuevo.");
    }
  }
}

String? menu() {
  print("\nMenú:");
  print("1. Agregar calificación");
  print("2. Mostrar calificaciones");
  print("3. Editar calificación");
  print("4. Salir");

  stdout.write("Elige una opción: ");
  String? opcion = stdin.readLineSync();
  return opcion;
}

void agregarCalificacion(Map<String, int> mapaCalificaciones) {
  stdout.write("\nIntroduce el nombre del estudiante: ");
  String? nombre = stdin.readLineSync();

  if (nombre == null || nombre.isEmpty) {
    print("El nombre no puede estar vacío.");
    return;
  }

  stdout.write("Introduce la calificación de $nombre (0-10): ");
  String? entrada = stdin.readLineSync();

  if (entrada != null && int.tryParse(entrada) != null) {
    int calificacion = int.parse(entrada);

    if (calificacion >= 0 && calificacion <= 10) {
      mapaCalificaciones[nombre] = calificacion;
      print("Calificación de $nombre registrada correctamente.");
    } else {
      print("La calificación debe estar entre 0 y 10.");
    }
  } else {
    print("Entrada inválida. Por favor, introduce un número.");
  }
}

void mostrarCalificaciones(Map<String, int> mapaCalificaciones) {
  if (mapaCalificaciones.isEmpty) {
    print("\nNo hay calificaciones registradas.");
  } else {
    print("\nCalificaciones de los estudiantes:");
    mapaCalificaciones.forEach((nombre, calificacion) {
      print("$nombre: $calificacion");
    });
  }
}

void editarCalificacion(Map<String, int> mapaCalificaciones) {
  if (mapaCalificaciones.isEmpty) {
    print("\nNo hay calificaciones registradas.");
    return;
  }

  stdout.write("\nIntroduce el nombre del estudiante cuya calificación deseas editar: ");
  String? nombre = stdin.readLineSync();

  if (nombre != null && mapaCalificaciones.containsKey(nombre)) {
    print("La calificación actual de $nombre es: ${mapaCalificaciones[nombre]}");

    stdout.write("Introduce la nueva calificación para $nombre (0-10): ");
    String? entrada = stdin.readLineSync();

    if (entrada != null && int.tryParse(entrada) != null) {
      int nuevaCalificacion = int.parse(entrada);

      if (nuevaCalificacion >= 0 && nuevaCalificacion <= 10) {
        mapaCalificaciones[nombre] = nuevaCalificacion;
        print("La calificación de $nombre ha sido actualizada a $nuevaCalificacion.");
      } else {
        print("La calificación debe estar entre 0 y 10.");
      }
    } else {
      print("Entrada inválida. Por favor, introduce un número.");
    }
  } else {
    print("Estudiante no encontrado.");
  }
}
