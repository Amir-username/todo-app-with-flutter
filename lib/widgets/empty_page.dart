import 'package:flutter/material.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Column(
        children: const[
              Icon(Icons.list, size: 100, color: Colors.cyan,),
              Text("there is no working to do :)", style: TextStyle(color: Colors.cyan),)
        ],
      ),
      )
    );
  }
}