import 'package:flutter/material.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_fonts.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
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
              AppImages.onboardingImage
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
          child: CustomButton(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                  return RegesterScreen();
                }));
              },
              title: AppTexts.letsStart,
              color: AppColors.mainColor,
              icon: Image.asset(AppImages.arrowLeft),
          ),
        )
      ],
    );
  }
}
