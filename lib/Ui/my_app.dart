import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/Data/Datasources/Remote/clientedatasource.dart';
import 'package:proyectomoil/Data/Datasources/Remote/iclientedatasource.dart';
import 'package:proyectomoil/Data/Repositories/clientesrepository.dart';
import 'package:proyectomoil/Domain/Repositories/iclientesrepositories.dart';
import 'package:proyectomoil/Domain/UseCases/clientesusecase.dart';
import 'package:proyectomoil/ui/pages.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UsController());
    Get.put(UcController());
    Get.put(LoginController());
    Get.put(SoportesController());
    // getput del cliente

    Get.put<IClienteDataSource>(ClienteDataSource());
    Get.put<IClienteRepository>(ClienteRepository(Get.find()));
    Get.put(ClienteUseCase(Get.find()));
    Get.put(ClientesController());
    return GetMaterialApp(
      title: 'TextFields & Forms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/LoginScreen',
      getPages: [
        GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/uc', page: () => const uc()),
        GetPage(name: '/us', page: () => us()),
        GetPage(name: '/report', page: () => const Report()),
        GetPage(name: '/reporte', page: () => const Reportes()),
        GetPage(name: '/soporte', page: () => const Soportes()),
        GetPage(name: '/cliente', page: () => const Clientes()),
      ],
    );
  }
}
