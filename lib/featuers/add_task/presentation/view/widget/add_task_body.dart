import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';

class AddTaskBody extends StatefulWidget {
   AddTaskBody({super.key,});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerDescription = TextEditingController();

  DateTime date = DateTime.now();

  DateTime? startDate = DateTime.now();

  DateTime? endDate = DateTime.now();

  TimeOfDay? time ;

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
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.mainColor,),
              title: Text(
                AppTexts.startDate,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black
                ),
              ),
              subtitle: Text(
                startDate == null ? AppTexts.enterTheStartDate: convertDate(startDate!),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey
                ),
              ),
              trailing: InkWell(
                onTap: () async{
                  startDate = await showDatePicker(context: context, firstDate: date, lastDate: date.add(Duration(days: 365)));
                  setState(() {

                  });
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: AppColors.black,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month,color: AppColors.mainColor,),
              title: Text(
                AppTexts.endDate,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black
                ),
              ),
              subtitle: Text(
                endDate == null ? AppTexts.enterTheEndDate: convertDate(endDate!),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey
                ),
              ),
              trailing: InkWell(
                onTap: () async{
                  endDate = await showDatePicker(context: context, firstDate: date, lastDate: date.add(Duration(days: 365)));
                  setState(() {
                    
                  });
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: AppColors.black,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              leading: Icon(Icons.timer_outlined,color: AppColors.mainColor,),
              title: Text(
                AppTexts.addTime,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black
                ),
              ),
              subtitle: Text(
                time == null ? AppTexts.setATimeForTheTask : time!.format(context),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey
                ),
              ),
              trailing: InkWell(
                onTap: () async{
                  time =await showTimePicker(context: context, initialTime: TimeOfDay.now());
                  setState(() {

                  });
                },
                child: Image.asset(
                  AppImages.arrowDown,
                  color: AppColors.black,
                  width: 24,
                  height: 26.67,
                ),
              ),
            ),
          ),
          SizedBox(height: 62,),
          CustomButton(
              onTap: (){
                if(time!=null && startDate !=null && endDate !=null && controllerName.text.isNotEmpty){
                  notes.add(
                      NoteModel(
                          title: controllerName.text,
                          time: time!.format(context),
                          description: controllerDescription.text,
                          startDate: convertDate(startDate!),
                          endDate: convertDate(endDate!)
                      )
                  );
                  Navigator.pop(context);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppTexts.fillYourDetails)));
                }

              },
              title: AppTexts.addTask,
              color: AppColors.mainColor
          )
        ],
      ),
    );
  }
}
