import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.dateAndTime, required this.icon});
  final String title;
  final String dateAndTime;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
          borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium
        ),
        subtitle: Text(
          dateAndTime,
          style: Theme.of(context).textTheme.titleSmall
        ),
      ),
    );
  }
}
