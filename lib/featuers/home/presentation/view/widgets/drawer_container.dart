import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key, required this.text,  required this.icon});
  final String text;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)
            ),
            color: AppColors.mainColor.withOpacity(0.1)
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
