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
            child: Obx(() => ListView.builder(
                itemCount: soportesController.soportes.length,
                itemBuilder: (context, index) {
                  String key =
                      soportesController.soportes.keys.elementAt(index);
                  List<String> soporte = soportesController.soportes[key]!;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.support),
                      title: Text(soporte[0]), // Accede al nombre del soporte
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(child: Text('Editar soporte')),
                                content: SizedBox(
                                  height: 290,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Id del soporte',
                                        ),
                                        initialValue: key,
                                        readOnly: true,
                                        onChanged: (value) {
                                          key = value;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Nombre del soporte',
                                        ),
                                        initialValue: soporte[0],
                                        onChanged: (value) {
                                          soporte[0] = value;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Correo del soporte',
                                        ),
                                        initialValue: soporte[1],
                                        onChanged: (value) {
                                          soporte[1] = value;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Contrasena del soporte',
                                        ),
                                        initialValue: soporte[2],
                                        onChanged: (value) {
                                          soporte[2] = value;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              soportesController
                                                  .updateSoporte(key, soporte);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Editar'),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              soportesController
                                                  .removeSoporte(key);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Eliminar'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cerrar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            
            String nombre = '';
            String correo = '';
            String contrasena = '';
            return AlertDialog(
              title: Center(child: Text('Agregar soporte')),
              content: SizedBox(
                height: 290,
                child: Column(
                  children: [
                    
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre del soporte',
                      ),
                      onChanged: (value) {
                        nombre = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo del soporte',
                      ),
                      onChanged: (value) {
                        correo = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contrasena del soporte',
                      ),
                      onChanged: (value) {
                        contrasena = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        soportesController.addSoporte('${soportesController.soportes.length+1}', [nombre, correo, contrasena]);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          });
        },
        child: Icon(Icons.add), // Icono de añadir
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
