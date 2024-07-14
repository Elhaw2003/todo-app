import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/featuers/add_task/presentation/view/add_task_screen.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/body_home_screen.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key, required this.name, required this.photo});
   final String name;
   final File photo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.97),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: AppColors.mainColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return AddTaskScreen();
            }));
          },
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        drawer: Drawer(
          child: HomeScreenDrawer(
            photo: photo,
            name: name,
          ),
        ),
        body: BodyHomeScreen(
          name: name,
          photo: photo,
        )
      ),
    );
  }
}
