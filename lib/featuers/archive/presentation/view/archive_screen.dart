import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/archive/presentation/view/widget/archived_container.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key,});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> archivedNotes = notes.where((element) => element.archiveOrNot==true).toList();
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.97),
      appBar: AppBar(
        leading: SizedBox(),
        flexibleSpace: CustomAppbar(
          title: AppTexts.archivedTasks,
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 30),
        child: ListView.separated(
          itemCount: archivedNotes.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 18,);
          },
          itemBuilder: (context, index) {
          return  Column(
              children: [
          Container(
          decoration: BoxDecoration(
          color: AppColors.white,
              borderRadius: BorderRadius.circular(15)
          ),
            child: ListTile(
              title: Text(archivedNotes[index].title),
              subtitle: Text(archivedNotes[index].time),
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
                    archivedNotes[index].archiveOrNot=false;
                    setState(() {});
                 },
                     child: ArchivedContainer(colorContainer: AppColors.mainColor, colorText: AppColors.white)
            ),
            ),
          )
            ],
          );
        },
        ),
      )
    );
  }
}
