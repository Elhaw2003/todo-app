import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.text, required this.hintText});
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  text,
                  style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.black
                  ),
                  ),
              ],
            ),
            SizedBox(height: 7,),
            Text(
              textAlign: TextAlign.start,
              hintText,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
