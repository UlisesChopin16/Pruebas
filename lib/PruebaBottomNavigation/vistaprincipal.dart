import 'package:flutter/material.dart';
import 'package:prueba/PruebaBottomNavigation/popview.dart';


class Vistaprincipal extends StatefulWidget {
  const Vistaprincipal({ Key? key }) : super(key: key);

  @override
  State<Vistaprincipal> createState() => _VistaprincipalState();
}

class _VistaprincipalState extends State<Vistaprincipal> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Vista Principal'),
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list),
          ),
        ),
        body: const VistaBoton(),
      ),
    );
  }
}

class VistaBoton extends StatefulWidget {
  const VistaBoton({super.key});

  @override
  State<VistaBoton> createState() => _VistaBotonState();
}

class _VistaBotonState extends State<VistaBoton> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Business'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Popview(),
                  ),
                );
              },
              child: const Text('Ir a otra página'),
            ),
          ],
        ),
      ),
    );
  }
}
