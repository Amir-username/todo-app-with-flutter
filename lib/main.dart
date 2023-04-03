import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/theme/theme_switch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isDark = prefs.getBool('dark_mode');
  bool finalDark = false;

  if (isDark != null){
    finalDark = isDark;
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(
        finalDark ? darkTheme : lightTheme
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const HomeScreen(),
        )
    );
  }
}