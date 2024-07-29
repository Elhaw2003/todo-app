import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utilies/app_colors.dart';
import 'package:todo_app/core/utilies/app_images.dart';
import 'package:todo_app/core/utilies/app_texts.dart';
import 'package:todo_app/core/widgets/controller/theme_controller.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/featuers/home/presentation/controller/home_provider.dart';
import 'package:todo_app/featuers/home/presentation/view/home_screen.dart';
class RegesterScreen extends StatefulWidget {
   RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  TextEditingController nameControler = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile? image;

  getPhoto (ImageSource imageSource,) async{
    image = await picker.pickImage(source: imageSource);
    if(image!=null){
      Navigator.pop(context);
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white.withOpacity(0.97),
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
                                return getPhoto(ImageSource.camera);
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
                                return getPhoto(ImageSource.gallery);
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
                    color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                    border: Border.all(color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.mainColor,),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: image == null ? Icon(
                  Icons.add_a_photo,
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.white,
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
                    color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.grey:AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.white:AppColors.listTileDark,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          AppTexts.yourName,
                        style: TextStyle(
                            color: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.grey:AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 7,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.black:AppColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        ),
                        //to hide keyboard
                        cursorColor: Provider.of<ThemeProvider>(context).switchValue == false?AppColors.black:AppColors.white,
                        onTapOutside: (p) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        controller: nameControler,
                        decoration: InputDecoration(
                          hintText: AppTexts.enterYourName,
                            hintStyle: Theme.of(context).textTheme.titleSmall,
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
                  title: AppTexts.getStarted,
                  colorContainer: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
                  colorTitle: Provider.of<ThemeProvider>(context).switchValue == false? AppColors.white:AppColors.white,
                  colorBorder: Provider.of<ThemeProvider>(context).switchValue == false ? AppColors.mainColor:AppColors.blueDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}


