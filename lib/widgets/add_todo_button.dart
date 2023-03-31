import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todos_provider.dart';


class AddTodoButton extends StatefulWidget {
  const AddTodoButton({ Key? key }) : super(key: key);

  @override
  State<AddTodoButton> createState() => _AdTododButtonState();
}

class _AdTododButtonState extends State<AddTodoButton> {
    final titleController = TextEditingController();
    final statusController = TextEditingController();
    final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        label: const Text('Add Todo'),
        onPressed: (){
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
                ),
            ),
            builder: (BuildContext context) { 
                return Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 20),
          child: Form(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.cyan),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                       borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                       borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    hintText: 'title',
                  ),
                ),
                const Divider(),
                TextFormField(
                  controller: statusController,
                  style: const TextStyle(color: Colors.cyan),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                       borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                       borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    hintText: 'status',
                  ),
                ),
                const Divider(),
                TextFormField(
                  controller: descController,
                  style: const TextStyle(color: Colors.cyan),
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                       borderSide: const BorderSide(
                        color: Colors.cyan,
                      )
                    ),
                    hintText: 'description',
                  ),
                ),
                const Divider(),
                FloatingActionButton.extended(
                  onPressed: (){
                    final todo = Todo()
                      ..title = titleController.text
                      ..isDone = false
                      ..status = statusController.text
                      ..description = descController.text
                      ..date = DateTime.now();

                    context.read<TodoProvider>().addTodo(todo);

                    titleController.text = "";
                    statusController.text = "";
                    descController.text = "";

                    Navigator.pop(context);
                  },
                  label: const Text('Add'),
                ),
              ],
            ),
          )
        );
             },
             context: context,
          );
        },
        icon: const Icon(Icons.add_outlined),
      );
  }
}
