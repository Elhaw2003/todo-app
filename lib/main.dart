import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_fonts.dart';
import 'package:todo_app/featuers/onboarding/presentation/view/onboarding_screen.dart';

main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: ThemeData(
        fontFamily: AppFonts.lexendDeca
      ),
    );
  }
}
