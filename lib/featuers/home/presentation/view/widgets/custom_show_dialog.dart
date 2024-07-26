import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_small_button.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';

class CustomShowDialog extends StatefulWidget {
  const CustomShowDialog({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<CustomShowDialog> createState() => _CustomShowDialogState();
}

class _CustomShowDialogState extends State<CustomShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
        title: Text(
          AppTexts.areYoySureYouWantToDeleteThisTask,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSmallButton(
                onTap: (){
                  Provider.of<HomeProvider>(context,listen: false).removeNote(widget.noteModel,context);
                },
                colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.red:AppColors.red,
                colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
                colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.red:AppColors.red,
                title: AppTexts.yes
            ),
            CustomSmallButton(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {});
                },
                colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
                colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
                colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
                title: AppTexts.cancel,

            ),
          ],
        )
      ],
    );
  }
}
