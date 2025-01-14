import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_appbar.dart';
import 'package:todo_app/featuers/done_task_details/presentation/view/done_task_details_screen.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';
class  DoneScreen extends StatelessWidget {
  const  DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> doneList = Provider.of<HomeProvider>(context).notes.where((element) => element.doneOrNot==true).toList();
    return Scaffold(
      // backgroundColor: AppColors.white.withOpacity(0.97),
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
        child:  doneList.isEmpty ?Center(
            child: Text(
                AppTexts.noNotesDone,
              style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.black:AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            )) :ListView.separated(
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
                        color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      title: Text(
                          doneList[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                          doneList[index].time,
                          style:  TextStyle(
                            color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.mainColor,
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
                      trailing:Column(
                        children: [
                          Text(
                            doneList[index].startDate,
                              style: Theme.of(context).textTheme.titleSmall
                          ),
                          SizedBox(height: 12,),
                          Text(
                            doneList[index].endDate,
                            style: Theme.of(context).textTheme.titleSmall
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
