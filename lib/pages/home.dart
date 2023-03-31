import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/theme/theme_switch.dart';
import 'package:todo_app/widgets/add_todo_button.dart';
import 'package:todo_app/widgets/empty_page.dart';
import 'package:todo_app/widgets/todo_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text("Todo App", style: TextStyle(fontSize: 23),),
          ],
        ),
        centerTitle: true,
        elevation: 1,
        foregroundColor: Colors.cyan,
        actions: const [
          ThemeSwitcher(),
        ],
      ),
      body: context.watch<TodoProvider>().todos.isEmpty ? const EmptyPage() : const TodoListView(),
      floatingActionButton: const AddTodoButton(),
    );
  }
}