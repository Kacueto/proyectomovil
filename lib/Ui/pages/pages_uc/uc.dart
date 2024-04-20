import "package:flutter/material.dart";

class Uc extends StatelessWidget {
  const Uc({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //escribe aqui todo tu codigo del Uc
          ],
        ),
      ),
    );
  }
}