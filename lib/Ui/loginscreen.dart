import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages.dart';
import 'package:proyectomoil/widgets/custom_input_field.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Map<String, String> formvalues = {
      'email': '',
      'password': '',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomInputField(labelText: 'Email', formProperty: 'email', keyboardType: TextInputType.emailAddress,formValues: formvalues,),
              const SizedBox(height: 30.0),
               CustomInputField(labelText: 'Password',formProperty: 'password',obscureText: true, formValues: formvalues,),
              const SizedBox(height: 30.0),
              ElevatedButton(
                //onPressed: () => Get.off(Us()),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!formKey.currentState!.validate()) {
                    return; 
                  }
                  if (formvalues['email'] == 'a@a.com' && formvalues['password'] == '123456') {
                    Get.off(uc());
                  } else {
                    Get.off(us());
                  }
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
