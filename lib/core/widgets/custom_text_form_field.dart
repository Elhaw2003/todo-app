import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.title,  this.maxLine=1,  this.minLine=1, this.controller});
  final String hintText;
  final String title;
  final int maxLine;
  final int minLine;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.black
              ),
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText:hintText,
                hintStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.grey
                ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none
              ),
              maxLines: maxLine,
              minLines: minLine,
            )
          ],
        ),
      ),
    );
  }
}
