import 'package:flutter/material.dart';

class Reportes extends StatelessWidget {
  const Reportes({Key? key}) : super(key: key);

   // Añade tus Reportes aquí

  @override
  Widget build(BuildContext context) {
final List<String> reportes = ['Reporte 1', 'Reporte 2', 'Reporte 3', 'Reporte 4', 'Reporte 5', 'Reporte 6', 'Reporte 7', 'Reporte 8', 'Reporte 9', 'Reporte 10', 'Reporte 11', 'Reporte 12', 'Reporte 13', 'Reporte 14'];    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: reportes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.report), // Icono de persona
                title: Text(reportes[index]),
                trailing: Icon(Icons.arrow_forward), // Icono de flecha
              ),
            );
          },
        ),
      ),
    );
  }
}
