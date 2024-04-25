import 'package:flutter/material.dart';

class Clientes extends StatelessWidget {
  const Clientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> clientes = [
      'Cliente 1',
      'Cliente 2',
      'Cliente 3',
      'Cliente 4',
      'Cliente 5',
      'Cliente 6',
      'Cliente 7',
      'Cliente 8',
      'Cliente 9',
      'Cliente 10',
      'Cliente 11',
      'Cliente 12',
      'Cliente 13',
      'Cliente 14'
    ];
    final List<String> clientesUnicos = clientes.toSet().toList(); // Elimina los duplicados
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Clientes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.92, // 80% del ancho de la pantalla
          child: ListView.builder(
            itemCount: clientesUnicos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.person), // Icono de persona
                  title: Text(clientesUnicos[index]),
                  trailing: Icon(Icons.arrow_forward), // Icono de flecha
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
