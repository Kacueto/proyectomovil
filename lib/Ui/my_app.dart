import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/Ui/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'TextFields & Forms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/LoginScreen',
        getPages: 
        [GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/Uc', page: () => const Uc()),
        GetPage(name: '/Us', page: () =>  Us())],);
  }
}
