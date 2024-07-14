import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title,this.icon, required this.color, this.onTap});
  final String title;
  final Widget? icon;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      fontFamily: AppFonts.lexendDeca,
                      color: AppColors.white
                  ),
                ),
              ),
              SizedBox(child: icon,)
            ],
          ),
        ),
      ),
    );
  }
}
