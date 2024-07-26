import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';

import 'widgets/container_widget.dart';
import 'widgets/list_tile_widget.dart';
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
                hintText: Provider.of<HomeProvider>(context).notes[index].title
            ),
            SizedBox(height: 16,),
            ContainerWidget(
              text: AppTexts.description,
              hintText: Provider.of<HomeProvider>(context).notes[index].description,
            ),
            SizedBox(height: 24,),
            ListTileWidget(
                title: AppTexts.startDate,
                dateAndTime: Provider.of<HomeProvider>(context).notes[index].startDate,
                icon: Icon(Icons.calendar_month,color: AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(
                title: AppTexts.endDate,
                dateAndTime: Provider.of<HomeProvider>(context).notes[index].endDate,
                icon: Icon(Icons.calendar_month,color:AppColors.mainColor,)),
            SizedBox(height: 16,),
            ListTileWidget(
                title: AppTexts.addTime,
                dateAndTime: Provider.of<HomeProvider>(context).notes[index].time,
                icon: Icon(Icons.timer_outlined,color: AppColors.mainColor,))
          ],
        ),
      ),
    );
  }
}
