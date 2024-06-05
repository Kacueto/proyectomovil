import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';
import '../../../Domain/Models/soporte.dart';

class Soportes extends StatelessWidget {
  const Soportes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SoportesController soportesController = Get.find();
    return Scaffold(
      //backgroundColor: Colors.grey,
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
                itemCount: soportesController.soportesList.length,
                itemBuilder: (context, index) {
                  Soporte soporte =
                      soportesController.soportesList[index];
                  
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.support),
                      title: Text(soporte.name), // Accede al nombre del soporte
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
                                        initialValue: soporte.id.toString(),
                                        readOnly: true,
                                        onChanged: (value) {
                                          soporte.id = int.parse(value);
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Nombre del soporte',
                                        ),
                                        initialValue: soporte.name,
                                        onChanged: (value) {
                                          soporte.name = value;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Correo del soporte',
                                        ),
                                        initialValue: soporte.email,
                                        onChanged: (value) {
                                          soporte.email = value;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Contrasena del soporte',
                                        ),
                                        initialValue: soporte.password.toString(),
                                        onChanged: (value) {
                                          soporte.password = int.parse(value);
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              soportesController
                                                  .updateSoporte(soporte);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Editar'),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              soportesController
                                                  .deleteSoporte(soporte.id);
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
            
            Soporte soportenuevo = Soporte(id: 0, name: '', email: '', password: 0);
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
                        soportenuevo.name = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo del soporte',
                      ),
                      onChanged: (value) {
                        soportenuevo.email = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contrasena del soporte',
                      ),
                      onChanged: (value) {
                        soportenuevo.password = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        soportenuevo.id = soportesController.firstIdEmpty();
                        soportesController.addSoporte(soportenuevo);
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
