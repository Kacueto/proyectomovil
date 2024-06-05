import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

import '../../../Domain/Models/reporte.dart';

class Reportes extends StatelessWidget {
  const Reportes({Key? key}) : super(key: key);

   // Añade tus Reportes aquí

  @override
  Widget build(BuildContext context) {
    ReporteController reporteController = Get.find();
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: reporteController.reportesList.length,
          itemBuilder: (context, index) {
            Reporte reporte = reporteController.reportesList[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.report), // Icono de persona
                title: Text(reporte.title),
                
                trailing: Icon(Icons.arrow_forward), // Icono de flecha
              ),
            );
          },
        ),
      ),
      
    );
  }
}
