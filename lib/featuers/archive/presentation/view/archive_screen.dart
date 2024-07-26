import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/core/widgets/custom_small_button.dart';
import 'package:todo_app/featuers/archive_task_details/presentation/view/archive_details_screen.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';
class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key,});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> archivedNotes = Provider.of<HomeProvider>(context).notes.where((element) => element.archiveOrNot==true).toList();
    return Scaffold(
      // backgroundColor: AppColors.white.withOpacity(0.97),
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
        child: archivedNotes.isEmpty ? Center(
            child: Text(
                AppTexts.noNotesArchived,
              style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            )):ListView.separated(
          itemCount: archivedNotes.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 18,);
          },
          itemBuilder: (context, index) {
          return  Column(
              children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return ArchiveDetailsScreen(
                    noteModel: archivedNotes[index]
                );
              })).then((value) => setState(() {}));
            },
            child: Container(
            decoration: BoxDecoration(
            color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                borderRadius: BorderRadius.circular(15)
            ),
              child: ListTile(
                title: Text(
                    archivedNotes[index].title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                    archivedNotes[index].time,
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.mainColor:AppColors.mainColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
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
                 trailing: CustomSmallButton(
                     onTap: (){
                       archivedNotes[index].archiveOrNot=false;
                       setState(() {});
                     },
                     colorContainer: AppColors.mainColor,
                     colorTitle: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.white:AppColors.dark,
                     colorBorder: AppColors.mainColor,
                     title: AppTexts.unarchive,
                 ),
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
