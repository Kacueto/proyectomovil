import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';
import 'package:proyectomoil/ui/pages/controllers/uscontroller.dart';


class us extends StatelessWidget {
  const us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsController usController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('us'),
        actions: [
          IconButton(
            onPressed: () {
              LoginController loginController = Get.find();
              loginController.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ver todos los reportes:',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: usController.reportes.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(usController.reportes[index]),
                                  onTap: () => usController.goToreport(usController.reportes[index]),
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: const Text('Ver Reportes')),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selecciona un cliente:',
              style: TextStyle(fontSize: 18),
            ),
            Obx(() => DropdownButton<String>(
              value: usController.selectedCliente.value,
              onChanged: (String? newValue) {
                usController.selectedCliente.value = newValue!;
              },
              items: usController.clientes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  
                );
              }).toList(),
            )),
            const SizedBox(height: 16),
            const Text(
              'Escribe el reporte:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: [
                TextField(
                  onChanged: (value) {
                    usController.report.value = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el reporte',
                  ),
                  minLines: 1,
                  maxLines: 4,
                  expands: false,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Guardar el reporte con la hora actual
                    FocusScope.of(context).requestFocus(FocusNode());
                    String hora = DateTime.now().toString();
                    String reporteGuardado =
                        '$hora - ${usController.report.value} - ${usController.selectedCliente.value}';
                    print(reporteGuardado);
                  },
                  child: const Text('Guardar Reporte'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}