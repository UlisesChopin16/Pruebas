import 'package:flutter/material.dart';

class AnimatedList1 extends StatefulWidget {
  const AnimatedList1({ Key? key }) : super(key: key);

  @override
  State<AnimatedList1> createState() => _AnimatedList1State();
}

class _AnimatedList1State extends State<AnimatedList1> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 10,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero
            ).animate(animation),
            child: ListTile(
              title: Text('Item $index'),
              onTap: (){
                _listKey.currentState!.insertItem(
                  index, 
                );
              }
            ),
          );
        }
      ),
    );
  }
}