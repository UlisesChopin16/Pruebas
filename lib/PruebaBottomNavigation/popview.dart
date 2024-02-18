import 'package:flutter/material.dart';

class Popview extends StatefulWidget {
  const Popview({ Key? key }) : super(key: key);

  @override
  _PopviewState createState() => _PopviewState();
}

class _PopviewState extends State<Popview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.line_weight_sharp),
        ),
        title: const Text('Popview'),
      ),
      body: const Center(
        child: Text('Popview'),
      ),
    );
  }
}