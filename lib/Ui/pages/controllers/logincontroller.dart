import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

final SoportesController soportesController = Get.find();

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: '');

  void autenticacion(formKey) {
    if (!formKey.currentState.validate!()) {
      return;
    }
    bool esSoporte = soportesController.soportes.values.any((soporte) {
      if (soporte[1] == email.value.text && soporte[2] == password.value.text) {
        return true;
      }
      return false;
    });

    if (email.value.text == 'a@a.com' && password.value.text == '123456') {
      Get.offNamed('/uc');
    }else if (esSoporte) {
      Get.offNamed('/us');
    }else {
      Get.snackbar('Error', 'Usuario o contraseña incorrectos');
    }
  }

  void logout() {
    email.clear();
    password.clear();
    Get.offNamed('/LoginScreen');
  }
}
