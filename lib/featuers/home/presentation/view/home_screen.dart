import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/featuers/home/presentation/view/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name, required this.photo,});
   final String name;
   final File photo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: AppColors.mainColor,
          onPressed: (){},
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        drawer: Drawer(
        ),
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            CustomAppbar(name: name, photo: photo),
            SizedBox(height: 26,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder:  (context, index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        alignment: Alignment.centerLeft,
                          color: AppColors.red,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Icon(Icons.delete,
                              color: AppColors.white,
                              size: 19,
                            ),
                          )
                      ),
                      key: GlobalKey(),
                      child: Card(
                        color: AppColors.white,
                        shadowColor: AppColors.white,
                        child: ListTile(
                          title: Text("sbdb"),
                          subtitle: Text("snfj"),
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
                          trailing: Container(
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Text(
                                AppTexts.done,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
