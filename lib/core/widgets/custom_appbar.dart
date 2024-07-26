import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, this.onTap, });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Theme.of(context).appBarTheme;
    return  AppBar(
      leading: InkWell(
          onTap: onTap,
          child: Image.asset(AppImages.arrowRight,
            color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
            width: 20,height: 15,)),
      centerTitle: true,
      title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge
      ),
    );
  }
}
