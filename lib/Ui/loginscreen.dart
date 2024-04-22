import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';
import 'package:proyectomoil/widgets/widgets.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    LoginController loginController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CustomInputField(labelText: 'Email', formProperty: 'email', controller: loginController.email,),
              const SizedBox(height: 30.0),
                CustomInputField(labelText: 'Password',formProperty: 'password',obscureText: true, controller: loginController.password, ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  loginController.autenticacion(formKey);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
