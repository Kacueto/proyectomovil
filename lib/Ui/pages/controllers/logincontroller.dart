import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: '');
  
  
  void autenticacion(formKey) {
    if (!formKey.currentState.validate!()) {
      return;
    }
    if (email.value.text == 'a@a.com' && password.value.text == '123456') {
      Get.offNamed('/uc');
    } else {
      Get.offNamed('/us');
    }
}

  void logout() {
    email.clear();
    password.clear();
    Get.offNamed('/LoginScreen');
  }}