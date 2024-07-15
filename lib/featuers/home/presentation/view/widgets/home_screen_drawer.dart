import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/featuers/archive/presentation/view/archive_screen.dart';
import 'package:todo_app/featuers/done/presentation/view/done_screen.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/drawer_container.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key, required this.name, required this.photo});
  final String name;
  final File photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.mainColor
          ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 33,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.file(
                      photo,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
                SizedBox(width: 12,),
                Text(
                    name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                )
              ],
            )
        ),
        SizedBox(height: 18,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return ArchiveScreen();
            }));
          },
          child: DrawerContainer(
              text: AppTexts.archivedTasks,
              icon: Icon(Icons.archive_outlined,color: AppColors.mainColor,),
          ),
        ),
        SizedBox(height: 20,),
        DrawerContainer(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return DoneScreen();
            }));
          },
          text: AppTexts.doneTasks,
          icon: Image.asset(AppImages.done),
        )
      ],
    );
  }
}
