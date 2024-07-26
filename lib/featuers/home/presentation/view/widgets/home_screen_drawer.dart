import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/featuers/archive/presentation/view/archive_screen.dart';
import 'package:todo_app/featuers/done/presentation/view/done_screen.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/drawer_container.dart';
class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({super.key, required this.name, required this.photo});
  final String name;
  final File photo;

  @override
  State<HomeScreenDrawer> createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.drawerHeader,
          ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.drawerHeader,
                  radius: 33,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.file(
                      widget.photo,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Text(
                      widget.name,
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    )
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
        ),
        SizedBox(height: 25,),
        DrawerContainer(
            text: AppTexts.lightOrDark,
            icon: Switch(
              value: Provider.of<ThemeProvider>(context).switchValue,
              onChanged: (b){
                Provider.of<ThemeProvider>(context,listen: false).changeSwitchValue(b);
              },
            )
        )
      ],
    );
  }
}
