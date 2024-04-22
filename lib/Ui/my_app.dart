import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UsController());
    Get.put(LoginController());
    return GetMaterialApp(
        title: 'TextFields & Forms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/LoginScreen',
        getPages: 
        [GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/uc', page: () => const uc()),
        GetPage(name: '/us', page: () =>  us()),
        GetPage(name: '/report', page:()=> const Report())],);
  }
}
