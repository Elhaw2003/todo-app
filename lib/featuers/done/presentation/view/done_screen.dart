import 'package:flutter/material.dart';
import 'package:todo_app/core/data/lists/task_list.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/done_task_details_screen.dart';
class  DoneScreen extends StatelessWidget {
  const  DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> doneList = notes.where((element) => element.doneOrNot==true).toList();
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.97),
      appBar: AppBar(
        leading: SizedBox(),
        flexibleSpace: CustomAppbar(
          title: AppTexts.doneTasks,
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child:  doneList.isEmpty ?Center(child: Text(AppTexts.noNotesDone)) :ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 18,);
            },
          itemCount: doneList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c){
                      return DoneTaskDetailsScreen(
                        index: index,
                      );
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      title: Text(doneList[index].title),
                      subtitle: Text(doneList[index].time),
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
                      trailing:Column(
                        children: [
                          Text(
                            doneList[index].startDate,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.grey
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            doneList[index].endDate,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.grey
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
