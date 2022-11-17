import 'package:flutter/material.dart';
import 'package:reto2/controlador/controladorGeneral.dart';
import 'package:get/get.dart';

class pag1_inicio extends StatefulWidget {
  const pag1_inicio({super.key});

  @override
  State<pag1_inicio> createState() => _pag1_inicioState();
}

class _pag1_inicioState extends State<pag1_inicio> {
  controladorGeneral Control = Get.find();
  int _counter = 4;

  void increment() {
    setState(() {
      if (_counter == 4) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (_counter == 0) {
        _counter = 4;
      } else {
        _counter = _counter - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            width: 50,
            height: 50,
          ),
          const Image(image: AssetImage("assets/images/logo1.png"), width: 300),
          const SizedBox(
            width: 60,
            height: 60,
          ),
          Image(image: AssetImage("assets/images/cuadros.jpg")),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            // verticalDirection: VerticalDirection.up,
            children: [
              Container(
                  width: 30,
                  child: IconButton(
                      iconSize: 30,
                      alignment: Alignment.center,
                      onPressed: decrement,
                      icon: Image(
                        image: AssetImage("assets/images/arrowL.png"),
                        width: 50,
                        color: Colors.black,
                      ))),
              Container(
                alignment: Alignment.center,
                child: Image(
                    image: AssetImage(Control.pro[_counter].imagen),
                    width: 295),
              ),
              Container(
                width: 30,
                child: IconButton(
                    iconSize: 30,
                    alignment: Alignment.center,
                    onPressed: increment,
                    icon: Image(
                      image: AssetImage("assets/images/arrowR.png"),
                      width: 50,
                      color: Colors.black,
                    )),
              )
            ],
          ),
          Image(image: AssetImage("assets/images/cuadros.jpg")),
        ],
      )),
    );
  }
}
