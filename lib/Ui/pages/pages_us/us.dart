

import 'package:flutter/material.dart';


class Us extends StatefulWidget {
  const Us({super.key});

  @override
  State<Us> createState() => _UsState();
}

class _UsState extends State<Us> {
  List<String> clientes = [
    'Cliente 1',
    'Cliente 2',
    'Cliente 3',
  ];

   String selectedCliente = 'Cliente 1';

  late String reporte = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UssUs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona un cliente:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedCliente,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCliente = newValue!;
                });
              },
              items: clientes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Escribe el reporte:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: [
                TextField(
                  onChanged: (value) {
                    reporte = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el reporte',
                  ),
                  minLines: 1,
                  maxLines: 8,
                  expands: false,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Guardar el reporte con la hora actual
                    String hora = DateTime.now().toString();
                    String reporteGuardado = '$hora - $reporte - $selectedCliente';
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