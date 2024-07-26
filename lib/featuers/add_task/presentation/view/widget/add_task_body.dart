import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';

class AddTaskBody extends StatefulWidget {
   AddTaskBody({super.key,});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerDescription = TextEditingController();
  String convertDate(DateTime date){
    return date.toString().split(" ")[0];
  }
  // String convertTime(TimeOfDay time){
  //   return "${time.hour}:${time.minute} ${time.period.name}";
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 30),
      child: ListView(
        children: [
          CustomTextFormField(
              hintText: AppTexts.enterTheTaskName,
              title: AppTexts.taskName,
              controller: controllerName,
          ),
          SizedBox(height: 16,),
          CustomTextFormField(
            hintText: AppTexts.enterTheTaskDescription,
            title: AppTexts.description,
            maxLine: 6,
            minLine: 3,
            controller: controllerDescription,
          ),
          SizedBox(height: 24,),
          Container(
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.mainColor,),
              title: Text(
                AppTexts.startDate,
                  style:Theme.of(context).textTheme.titleMedium
              ),
              subtitle: Text(
                Provider.of<HomeProvider>(context,listen: false).startDate == null ? AppTexts.enterTheStartDate: convertDate(Provider.of<HomeProvider>(context,listen: false).startDate!),
                  style: Theme.of(context).textTheme.titleSmall
              ),
              trailing: InkWell(
                onTap: () async{
                  Provider.of<HomeProvider>(context,listen: false).selectStartDate(context);
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.mainColor,),
              title: Text(
                AppTexts.endDate,
                  style:Theme.of(context).textTheme.titleMedium
              ),
              subtitle: Text(
                Provider.of<HomeProvider>(context).endDate == null ? AppTexts.enterTheEndDate: convertDate(Provider.of<HomeProvider>(context).endDate!),
                  style: Theme.of(context).textTheme.titleSmall
              ),
              trailing: InkWell(
                onTap: () async{
                  Provider.of<HomeProvider>(context,listen: false).selectEndDate(context);
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.timer_outlined,color: AppColors.mainColor,),
              title: Text(
                AppTexts.addTime,
                  style:Theme.of(context).textTheme.titleMedium
              ),
              subtitle: Text(
                Provider.of<HomeProvider>(context,listen: false).time == null ? AppTexts.setATimeForTheTask : Provider.of<HomeProvider>(context).time!.format(context),
                  style: Theme.of(context).textTheme.titleSmall
              ),
              trailing: InkWell(
                onTap: () async{
                  Provider.of<HomeProvider>(context,listen: false).selectTime(context);
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 62,),
          CustomButton(
              onTap: (){
                Provider.of<HomeProvider>(context,listen: false).addNote(
                    title: controllerName.text,
                    description: controllerDescription.text,
                  context: context
                );

              },
            title: AppTexts.addTask,
            colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
            colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
            colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
          )
        ],
      ),
    );
  }
}
