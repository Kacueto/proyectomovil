import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

class Soportes extends StatelessWidget {
  const Soportes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SoportesController soportesController = Get.find();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Soportes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.92, // 80% del ancho de la pantalla
          child: ListView.builder(
            itemCount: soportesController.soportes.length,
            itemBuilder: (context, index) {
              String key = soportesController.soportes.keys.elementAt(index);
              List<String> soporte = soportesController.soportes[key]!;
              return Card(
                child: ListTile(
                  leading: Icon(Icons.support),
                  title: Text(soporte[0]), // Accede al nombre del soporte
                  trailing: Icon(Icons.arrow_forward),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
        },
        child: Icon(Icons.add), // Icono de añadir
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
