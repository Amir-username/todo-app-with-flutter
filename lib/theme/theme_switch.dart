import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white60,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  shadowColor: Colors.cyan,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  primaryColor: Colors.cyan,
  shadowColor: Colors.cyan,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan
  )
);


class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Provider.of<ThemeProvider>(context, listen: false).themeData == darkTheme ? const Icon(Icons.light_mode, size: 23,) : const Icon(Icons.dark_mode, size: 23,),
        onPressed: (){
          setState(() {

          });
          ThemeData theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
          if(theme == lightTheme){
            Provider.of<ThemeProvider>(context, listen: false).themeData = darkTheme;
          }
          else{
            Provider.of<ThemeProvider>(context, listen: false).themeData = lightTheme;
          }
        }
    );
  }
}
