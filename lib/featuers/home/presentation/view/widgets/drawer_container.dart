import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key, required this.text,  required this.icon, this.onTap});
  final String text;
  final Widget? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12)
              ),
              color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor.withOpacity(0.1):AppColors.listTileDark,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  child: icon,
                ),
                SizedBox(width: 7,),
                Text(
                  text,
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.mainColor:AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
