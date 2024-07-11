import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/featuers/home/presentation/view/home_screen.dart';

class RegesterScreen extends StatefulWidget {
   RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  final ImagePicker picker = ImagePicker();
    XFile? image;

  getPhoto (ImageSource imageSource) async{
    image = await picker.pickImage(source: imageSource);
    if(image!=null){
      Navigator.pop(context);
    }
    setState(() {

    });
  }

  TextEditingController nameControler = TextEditingController();

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
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    backgroundColor: AppColors.white,
                      context: context, builder:(c){
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                return getPhoto(
                                    ImageSource.camera
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Icon(
                                        Icons.add_a_photo,
                                      color: AppColors.mainColor,
                                      size: 30,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                        AppTexts.camera,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: AppColors.mainColor
                                      ),
                                    )
                                  ],
                                  mainAxisSize: MainAxisSize.min,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap : (){
                                return getPhoto(
                                  ImageSource.gallery
                                );
                              },
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.photo,
                                      color: AppColors.mainColor,
                                      size: 30,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      AppTexts.gallery,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: AppColors.mainColor
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  } );
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: image == null ? Icon(
                  Icons.add_a_photo,
                  color: AppColors.mainColor,
                  size: 40,
                ): ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.file(File(image!.path),fit: BoxFit.cover,)
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                  image == null ? AppTexts.addPhoto : AppTexts.updatePhoto,
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
                  border: Border.all(color: AppColors.mainColor)
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
                        controller: nameControler,
                        decoration: InputDecoration(
                          hintText: AppTexts.enterYourName,
                          hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
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
              InkWell(
                onTap: (){
                  if(image == null ){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppTexts.select_Photo_name)));
                  }
                  else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                      return HomeScreen(
                        name: nameControler.text,
                        photo:File(image!.path),
                      );
                    }));
                  }
                },
                child: CustomButton(
                    title: AppTexts.getStarted,
                    color: AppColors.mainColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


