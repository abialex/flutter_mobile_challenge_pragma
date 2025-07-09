import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';
import 'package:flutter_mobile_challenge_pragma/boostrap.dart';

void main() {
  AppFlavorConfig.appFlavor = Flavor.DEV;
  bootstrap(() => const Main());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale('en', 'US')],

      home: Scaffold(
        appBar: AppBar(title: const Text('Test App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(content: Text('Eliminando mascota....')),
                  );

                  // Simulando delay para probar
                  await Future.delayed(const Duration(seconds: 2));

                  if (!context.mounted) return;

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Mascota eliminada exitosamente')));
                },
                child: const Text('Eliminar mascota', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
