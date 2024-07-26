import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';

class ArchivedContainer extends StatelessWidget {
  const ArchivedContainer({super.key, required this.colorContainer,  required this.colorText});
  final Color colorContainer;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.mainColor)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Text(
          AppTexts.unarchive,
          style: TextStyle(
              color: colorText,
              fontWeight: FontWeight.w700,
              fontSize: 12
          ),
        ),
      ),
    );
  }
}
