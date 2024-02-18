import 'package:flutter/material.dart';

class CordenadasView extends StatefulWidget {
  const CordenadasView({ Key? key }) : super(key: key);

  @override
  _CordenadasViewState createState() => _CordenadasViewState();
}

class _CordenadasViewState extends State<CordenadasView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FittedBox(
            child: SizedBox(
              width: 595.275590551181, 
              height: 841.8897637795275,
              child: GestureDetector(
                onPanUpdate: (details){
                  print(details.localPosition);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://p.calameoassets.com/181204032312-06bffccc0e6f815e4f15a5ef07f174c2/p1.jpg'),
                      fit: BoxFit.contain
                    )
                  ),
                  child: Stack(
                    children:  [
                      Positioned(
                        left: 263,
                        top: 454.1,
                        child: Container(
                          width: 185,
                          height: 16,
                          child: const Text(
                            'Hola, soy un texto', 
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ]
                  )
                ),
              )
            ),
          )
        )
      )
      
    );
  }
}