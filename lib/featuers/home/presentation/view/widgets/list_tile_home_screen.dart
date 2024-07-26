import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_small_button.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/task_details.dart';
class ListTileHomeScreen extends StatefulWidget {
  const ListTileHomeScreen({super.key, required this.index});
  final int index;

  @override
  State<ListTileHomeScreen> createState() => _ListTileHomeScreenState();
}

class _ListTileHomeScreenState extends State<ListTileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c){
          return TaskDetails(
            noteModel: Provider.of<HomeProvider>(context).notes[widget.index],
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
            borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          title: Text(
              Provider.of<HomeProvider>(context).notes[widget.index].title,
            style: Theme.of(context).textTheme.titleMedium
          ),
          subtitle: Text(
              Provider.of<HomeProvider>(context).notes[widget.index].time,
            style: TextStyle(
              color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12
            )
          ),
          leading: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.grey.withOpacity(0.3),
              ),
              child: Image.asset(
                AppImages.bag,
                width: 23,
                height: 23,
              )
          ),
          trailing: Provider.of<HomeProvider>(context).notes[widget.index].doneOrNot==true ?
          CustomSmallButton(
                  onTap: (){
                    Provider.of<HomeProvider>(context).notes[widget.index].doneOrNot = !Provider.of<HomeProvider>(context).notes[widget.index].doneOrNot;
                  },
                  colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.mainColor,
                  colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.mainColor,
                  colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.dark,
                  title: AppTexts.done,
              )
              :
          CustomSmallButton(
            onTap: (){
              Provider.of<HomeProvider>(context,listen: false).notes[widget.index].doneOrNot = !Provider.of<HomeProvider>(context,listen: false).notes[widget.index].doneOrNot;
            },
            colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.mainColor,
            colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
            colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.mainColor:AppColors.white,
            title: AppTexts.done,
          ),
        ),
      ),
    );
  }
}