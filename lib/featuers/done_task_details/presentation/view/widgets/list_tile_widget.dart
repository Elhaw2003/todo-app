import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.dateAndTime, required this.icon});
  final String title;
  final String dateAndTime;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black
          ),
        ),
        subtitle: Text(
          dateAndTime,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey
          ),
        ),
      ),
    );
  }
}
