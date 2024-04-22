import "package:flutter/material.dart";
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

class cliente extends StatelessWidget {
  cliente({
    Key? key,
  }) : super(key: key);

  String id = '1';
  String nombre = 'Aitana Gonzalez';
  String correo = 'ag@a.com';
  String clave = '12345';

  @override
  Widget build(BuildContext context) {
    final UcController ucController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('uc'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Nombre:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: [
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: const InputDecoration(
                    hintText: '1',
                  ),
                  minLines: 1,
                  maxLines: 8,
                  expands: false,
                ),
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Aitana Gonzalez',
                  ),
                  minLines: 1,
                  maxLines: 8,
                  expands: false,
                ),
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'ag@a.com',
                  ),
                  minLines: 1,
                  maxLines: 8,
                  expands: false,
                ),
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: const InputDecoration(
                    hintText: '12345',
                  ),
                  minLines: 1,
                  maxLines: 8,
                  expands: false,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    //save changes
                  },
                  child: const Text('Guardar cambios'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
