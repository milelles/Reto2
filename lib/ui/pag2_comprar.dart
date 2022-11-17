import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto2/controlador/controladorGeneral.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class pag2_comprar extends StatefulWidget {
  const pag2_comprar({super.key});

  @override
  State<pag2_comprar> createState() => _pag2_comprarState();
}

class _pag2_comprarState extends State<pag2_comprar> {
  controladorGeneral Control = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => ListView.builder(
            itemCount: Control.pro.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child:ListTile(
                onTap: () {
                    Alert(
                        context: context,
                        title: Control.pro[index].nombre,
                        content: Image(image: AssetImage(Control.pro[index].imagen) )
                        ).show();
                  },
                leading: Image(image: AssetImage(Control.pro[index].imagen)),
                title: Text(Control.pro[index].nombre ),
                
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [Text("\$" +
                    Control.pro[index].precio.toString(), style: TextStyle(color: Colors.lightBlue), textAlign: TextAlign.left ,),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              int nuevaCantidad = Control.pro[index].cantidad + 1;
                              Control.cambiarCantidad(index, nuevaCantidad);
                              Control.pro.refresh();
                            },
                            icon: Icon(Icons.arrow_upward, size: 20,)),
                        VerticalDivider(),
                        Text(
                      Control.pro[index].cantidad.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    VerticalDivider(),
                        IconButton(
                            onPressed: () {
                              int nuevaCantidad = Control.pro[index].cantidad - 1;

                              if (nuevaCantidad < 0) {
                                nuevaCantidad = 0;
                              }

                              Control.cambiarCantidad(index, nuevaCantidad);
                              Control.pro.refresh();
                            },
                            icon: Icon(Icons.arrow_downward,size: 20,))
                      ],
                    ),
                  ],
                ),
              )
              );
            },
          )),
    );
  }
}
