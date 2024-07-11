import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.name, required this.photo});
  final String name;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListTile(
                leading: GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(
                    AppImages.menue,
                    width: 32,
                    height: 32,
                  ),
                ),
                title: Text(
                  AppTexts.hello,
                  style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                ),
                subtitle: Text(
                  name,
                  style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: Image.file(
                      photo,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                )
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Text(
              "${DateTime.now().day}"",""${DateTime.now().month}"",""${DateTime.now().year}",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
