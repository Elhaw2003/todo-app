import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/widgets/container_widget.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/widgets/list_tile_widget.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key,  required this.noteModel});
  final NoteModel noteModel;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.97),
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
            ContainerWidget(text: AppTexts.taskName, hintText: widget.noteModel.title),
            SizedBox(height: 16,),
            ContainerWidget(text: AppTexts.description, hintText: widget.noteModel.description),
            SizedBox(height: 24,),
            ListTileWidget(title: AppTexts.startDate, dateAndTime: widget.noteModel.startDate, icon: Icon(Icons.calendar_month,color: AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(title: AppTexts.endDate, dateAndTime: widget.noteModel.endDate, icon: Icon(Icons.calendar_month,color: AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(title: AppTexts.addTime, dateAndTime: widget.noteModel.time, icon: Icon(Icons.timer_outlined,color: AppColors.mainColor,)),
            SizedBox(height: 30,),
            CustomButton(
              onTap: (){
                notes[notes.indexOf(widget.noteModel)].archiveOrNot = !notes[notes.indexOf(widget.noteModel)].archiveOrNot;

                setState(() {});
              },
              title: notes[notes.indexOf(widget.noteModel)].archiveOrNot ==true ? AppTexts.unarchive:AppTexts.archive,
              color: AppColors.mainColor,
              icon: Icon(Icons.archive_outlined,color: AppColors.white,),
            ),
            SizedBox(height: 16,),
            CustomButton(
                title: AppTexts.delete,
                color: AppColors.red,
                icon: Icon(Icons.delete,color: AppColors.white,),
            )
          ],
        ),
      ),
    );
  }
}
