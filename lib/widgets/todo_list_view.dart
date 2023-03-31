import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({ Key? key }) : super(key: key);

  @override
  State<TodoListView> createState() => Todo_ListViewState();
}

class Todo_ListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: context
              .watch<TodoProvider>()
              .todos
              .map((todo) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 2,
                shadowColor: Colors.cyan,
                child: ListTile(
                    leading: IconButton(
                              onPressed: () => context
                                  .read<TodoProvider>()
                                  .toggleIsDone(todo.id),
                              icon: todo.isDone
                                  ? const Icon(Icons.check_circle, color: Colors.cyan, size: 28,)
                                  : const Icon(Icons.circle_outlined, color: Colors.cyan, size: 28,)
                              ),
                    title: Text(todo.title + " ( " + todo.status + " ) ",
                    style: todo.isDone ? const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ): null,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        children: [
                          Text(todo.date.hour.toString() + ":" + todo.date.minute.toString(), style: const TextStyle(fontSize: 14),),
                          const SizedBox(width: 2,),
                          const Icon(Icons.timer_outlined, color: Colors.cyan, size: 14,),
                        ]
                      ),
                    ),
                    trailing: IconButton(
                              onPressed: () {
                                context.read<TodoProvider>().delTodo(todo);
                              },
                              icon: const Icon(Icons.delete)),
                  ),
              )).toList(),
        ),
      );
  }
}