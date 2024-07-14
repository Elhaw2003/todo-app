import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, this.onTap, });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: InkWell(
          onTap: onTap,
          child: Image.asset(AppImages.arrowRight,color: AppColors.black,width: 20,height: 15,)),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
