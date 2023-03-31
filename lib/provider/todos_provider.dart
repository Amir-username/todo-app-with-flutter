import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import '../models/todo.dart';


class TodoProvider with ChangeNotifier{
  TodoProvider(){
    init();
  }

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Isar? isar;

  void init() async {
    //open database
    isar ??= await Isar.open(schemas: [TodoSchema]);
    // txn : read data
    await isar!.txn((isar) async {
      _todos = await isar.todos.where().findAll();
      notifyListeners();
    });
  }

  void mobileInit() async {
    final dir = await getApplicationSupportDirectory();
    isar ??= await Isar.open(schemas: [TodoSchema], directory: dir.path);
  }

  void addTodo(Todo todo) async {
    // writeTxn : write data
    await isar!.writeTxn((isar) async {
      // using put for add
      int id = await isar.todos.put(todo);
    });
    _todos.add(todo);
    notifyListeners();
  }

  void delTodo(Todo todo) async {
    await isar!.writeTxn((isar) async {
      // using delete for remove
      bool isDel = await isar.todos.delete(todo.id);
      
      if (isDel) _todos.remove(todo);
      notifyListeners();
    });
  }

  void toggleIsDone(int id) async {
    await isar!.writeTxn((isar) async {
      Todo? todo = await isar.todos.get(id);
      if (todo != null){
        todo.isDone = !todo.isDone;
        await isar.todos.put(todo);
        int todoIndex = todos.indexWhere((todo) => todo.id == id);
        todos[todoIndex].isDone = todo.isDone;
      }
      // using put for update
      notifyListeners();
    });
  }
}