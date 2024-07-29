import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';


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
        color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                title,
                style: Theme.of(context).textTheme.titleMedium
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.black:AppColors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              //to hide keyboard
              cursorColor: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.black:AppColors.white,
              onTapOutside: (p){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: controller,
              decoration: InputDecoration(
                  hintText:hintText,
                  hintStyle: Theme.of(context).textTheme.titleSmall,
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
