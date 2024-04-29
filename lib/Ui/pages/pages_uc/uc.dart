import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomoil/ui/pages/controllers/controllers.dart';




class uc extends StatelessWidget {
  const uc({super.key});

  @override
  Widget build(BuildContext context) {
    final UcController ucController = Get.find();
    final LoginController loginController = Get.find();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('UcKevin'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              
              loginController.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body:  
      Padding(
        padding:  const EdgeInsets.all(16.0), 
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              const Center(
                child: Column(
                  children:[
                    Text('Bienvenido cordinador', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('¿Que piensas hacer hoy?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],
                )
              ),
              const SizedBox(height: 140,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ucController.goToSupports();
                      },
                     child: Container( 
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 120,
                      child: const Center(child:  Text('Usuarios Soportes', textAlign: TextAlign.center,)),
                    ),
                    ),
                    const SizedBox(width: 50,),
                    GestureDetector(
                      onTap: () {
                        ucController.goToClients();
                      },
                     child: Container( 
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 120,
                      child: const Center(child:  Text('Usuarios Clientes', textAlign: TextAlign.center,)),
                    ),
                    ),
                    const SizedBox(width: 50,),
                    GestureDetector(
                      onTap: () {
                        ucController.goToReports();
                      },
                     child: Container( 
                      
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 120,
                      child: const Center(child:  Text('Reportes', textAlign: TextAlign.center,)),
                    ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
