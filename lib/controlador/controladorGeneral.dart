import 'package:get/get.dart';
import 'package:reto2/clases/productos.dart';

class controladorGeneral extends GetxController {
  final _posicionPagina = 0.obs;
  final pro = <productos>[].obs;
  @override
  void onInit() {
    pro.add(productos(
        1, "Camiseta Stranger", "assets/images/imagen1.jpg", 0, 80000));
    pro.add(productos(
        2, "Camiseta Clasica Vans", "assets/images/imagen2.jpg", 0, 70000));
    pro.add(
        productos(3, "Sudadera Vans", "assets/images/imagen4.jpg", 0, 120000));
    pro.add(productos(4, "Camiseta IT", "assets/images/imagen3.jpg", 0, 85000));
    pro.add(productos(
        5, "Camiseta Divine Energy", "assets/images/imagen5.jpg", 0, 80000));

    // TODO: implement onInit
    super.onInit();
  }

  void cambiarposicion(int x) {
    _posicionPagina.value = x;
  }

  int get posicionPagina => _posicionPagina.value;

  void cambiarCantidad(int posicion, int valor) {
    pro[posicion].cantidad = valor;
  }

  int calcularTotal() {
    int total = 0;
    for (int i = 0; i < pro.length; i++) {
      total = total + pro[i].cantidad * pro[i].precio;
    }

    return total;
  }

  void limpiartodo() {
    for (int i = 0; i < pro.length; i++) {
      pro[i].cantidad = 0;
    }
    calcularTotal();
  }
}
