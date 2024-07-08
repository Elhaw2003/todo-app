import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_fonts.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/featuers/regester/presentation/view/regester_screen.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52,vertical: 73),
          child: Image.asset(
              AppImages.onboarding
          ),
        ),
        SizedBox(height: 63,),
        Text("""ToDo List
Daily Task""",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              fontFamily: AppFonts.lexendDeca,
              color: AppColors.black
          ),
        ),
        SizedBox(height: 21,),
        Text("""This productive tool is designed to help
you better manage your task 
project-wise conveniently!""",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: AppFonts.lexendDeca,
              color: AppColors.grey
          ),
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: MaterialButton(
            color: AppColors.lightBlue,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.lightBlue)
            ),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                return RegesterScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      AppTexts.letsStart,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          fontFamily: AppFonts.lexendDeca,
                          color: AppColors.white
                      ),
                    ),
                  ),
                  Image.asset(AppImages.arrowleft)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
