import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/Domain/Models/cliente.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

class Clientes extends StatelessWidget {
  const Clientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientesController clientesController = Get.find();

    
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Clientes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.92, // 80% del ancho de la pantalla
          child: Obx(() => ListView.builder(
                itemCount: clientesController.clientesList.length,
                itemBuilder: (context, index) {
                  Cliente cliente = clientesController.clientesList[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person), // Icono de persona

                      title: Text(cliente.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    const Center(child: Text('Editar cliente')),
                                content: SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Id del cliente',
                                        ),
                                        initialValue: cliente.id.toString(),
                                        readOnly: true,
                                        onChanged: (value) {
                                          cliente.id = int.parse(value);
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Nombre del cliente',
                                        ),
                                        initialValue: cliente.name,
                                        onChanged: (value) {
                                          cliente.name = value;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              clientesController
                                                  .updateCliente(cliente);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Editar'),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              clientesController
                                                  .deleteCliente(cliente.id);
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
                                    child: const Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
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
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              Cliente clienteNuevo = Cliente(id: 0, name: '');
              return AlertDialog(
                title: const Center(child: Text('Agregar Cliente')),
                content: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre del cliente',
                        ),
                        onChanged: (value) {
                          clienteNuevo.name = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          clienteNuevo.id = clientesController.firstIdEmpty();
                          clientesController.addCliente(clienteNuevo);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Agregar'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add), // Icono de añadir
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
