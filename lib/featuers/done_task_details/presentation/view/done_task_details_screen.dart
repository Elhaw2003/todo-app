import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/widgets/container_widget.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/widgets/list_tile_widget.dart';

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
            ListTileWidget(
                title: AppTexts.startDate,
                dateAndTime: notes[index].startDate,
                icon: Icon(Icons.calendar_month,color: AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(
                title: AppTexts.endDate,
                dateAndTime: notes[index].endDate,
                icon: Icon(Icons.calendar_month,color:AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(
                title: AppTexts.addTime,
                dateAndTime: notes[index].time,
                icon: Icon(Icons.timer_outlined,color: AppColors.mainColor,))
          ],
        ),
      ),
    );
  }
}
