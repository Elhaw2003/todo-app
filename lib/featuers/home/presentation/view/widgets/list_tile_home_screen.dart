import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/done_container.dart';

class ListTileHomeScreen extends StatefulWidget {
  const ListTileHomeScreen({super.key, required this.index});
  final int index;

  @override
  State<ListTileHomeScreen> createState() => _ListTileHomeScreenState();
}

class _ListTileHomeScreenState extends State<ListTileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        title: Text(notes[widget.index].title),
        subtitle: Text(notes[widget.index].time),
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
        trailing: InkWell(
          onTap: (){
            notes[widget.index].doneOrNot = !notes[widget.index].doneOrNot;
            setState(() {});
          },
          child:notes[widget.index].doneOrNot==true ?
              DoneContainer(colorContainer: AppColors.mainColor, colorText: AppColors.white)
              :
          DoneContainer(colorContainer: AppColors.white, colorText: AppColors.mainColor,)
        ),
      ),
    );
  }
}
