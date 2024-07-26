import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.text, required this.hintText});
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
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
                  style:Theme.of(context).textTheme.titleMedium
                  ),
              ],
            ),
            SizedBox(height: 7,),
            Text(
              textAlign: TextAlign.start,
              hintText,
              style: Theme.of(context).textTheme.titleSmall
            )
          ],
        ),
      ),
    );
  }
}
