import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/add_task/presentation/view/widget/add_task_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.97),
      appBar: AppBar(
          backgroundColor: AppColors.white.withOpacity(0.97),
        flexibleSpace: CustomAppbar(
          onTap: (){
            Navigator.pop(context);
          },
          title: AppTexts.addTask,
        ),
        leading: SizedBox(),
      ),
      body: AddTaskBody(),
    );
  }
}
