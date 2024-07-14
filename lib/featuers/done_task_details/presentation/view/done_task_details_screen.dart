import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/widgets/container_widget.dart';

class DoneTaskDetailsScreen extends StatelessWidget {
  const DoneTaskDetailsScreen({super.key, required this.index,});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        flexibleSpace: CustomAppbar(
          title: AppTexts.taskDetails,
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 30),
        child: Column(
          children: [
            ContainerWidget(
                text: AppTexts.taskName,
                hintText: notes[index].title
            ),
            SizedBox(height: 16,),
            ContainerWidget(
              text: AppTexts.description,
              hintText: notes[index].description,
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
                  notes[index].startDate,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey
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
                  notes[index].endDate,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey
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
                  notes[index].time,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
