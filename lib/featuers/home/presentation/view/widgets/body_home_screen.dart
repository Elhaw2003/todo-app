import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/appbar_home_screen.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/list_tile_home_screen.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key, required this.name, required this.photo});
  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppbarHomeScreen(name: name, photo: photo),
        SizedBox(height: 26,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
            notes.isEmpty?
            Center(child: Text(AppTexts.noAddedNotes))  :

            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 18,);
              },
              itemCount: notes.length,
              itemBuilder:  (context, index) {
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Container(
                      alignment: Alignment.centerLeft,
                      color: AppColors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(Icons.delete,
                          color: AppColors.white,
                          size: 19,
                        ),
                      )
                  ),
                  key: GlobalKey(),
                  child: ListTileHomeScreen(
                    index: index,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
