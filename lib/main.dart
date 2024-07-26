import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/theme.dart';
import 'package:todo_app/featuers/onboarding/presentation/view/onboarding_screen.dart';

import 'core/widgets/controller/theme_controller.dart';
import 'featuers/home/presentation/controller/home_provider.dart';

main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>  ThemeProvider(),),
        ChangeNotifierProvider(create: (context) =>  HomeProvider(),)
      ],
      child: TodoApp()));
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightThemeData,
      themeMode: Provider.of<ThemeProvider>(context).switchValue == false ? ThemeMode.light :ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
