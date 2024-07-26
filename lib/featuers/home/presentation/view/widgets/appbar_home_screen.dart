import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
class AppbarHomeScreen extends StatelessWidget {
  const AppbarHomeScreen({super.key, required this.name, required this.photo});
  final String name;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.drawerHeader,
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
                    color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.blueLight:AppColors.white
                  )
                ),
                subtitle: Text(
                  name,
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.blueLight:AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 33,
                  child: CircleAvatar(
                    radius: 30,
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
                  color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
