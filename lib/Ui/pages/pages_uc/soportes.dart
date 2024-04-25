import 'package:flutter/material.dart';

class Soportes extends StatelessWidget {
  const Soportes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> Soportes = [
      'Soporte 1',
      'Soporte 2',
      'Soporte 3',
      'Soporte 4',
      'Soporte 5',
      'Soporte 6',
      'Soporte 7',
      'Soporte 8',
      'Soporte 9',
      'Soporte 10',
      'Soporte 11',
      'Soporte 12',
      'Soporte 13',
      'Soporte 14'
    ];
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
            itemCount: Soportes.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.support),
                  title: Text(Soportes[index]),
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
