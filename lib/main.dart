import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialize o SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ModularApp(
      module: AppModule(sharedPreferences: sharedPreferences),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
