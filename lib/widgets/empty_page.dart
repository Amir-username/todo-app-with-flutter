import 'package:flutter/material.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#6ED2F5
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Column(
        children: const [
              Image(
                image: AssetImage('images/todo_list_icon.png'),
              ),
              Text("there is no working to do :)", style: TextStyle(color: Colors.cyan),)
        ],
      ),
      )
    );
  }
}