import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_button.dart';

class RegesterScreen extends StatelessWidget {
  const RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          child: Column(
            children: [
              Image.asset(
                  AppImages.regesterImage,
              ),
              SizedBox(height: 5,),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(
                    Icons.add_a_photo,
                  color: AppColors.blue,
                  size: 40,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                  AppTexts.addPhoto,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.blue)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          AppTexts.yourName,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey
                        ),
                      ),
                      SizedBox(height: 7,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: AppTexts.enterYourName,
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              CustomButton(
                  title: AppTexts.getStarted,
                  color: AppColors.blue
              )
            ],
          ),
        ),
      ),
    );
  }
}


