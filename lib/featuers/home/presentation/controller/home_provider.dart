import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/data/models/note_model.dart';
import 'package:todo_app/core/utilies/app_texts.dart';


class HomeProvider extends ChangeNotifier {

  List<NoteModel> notes = [];
  String convertDate(DateTime date){
    return date.toString().split(" ")[0];
  }

  addNote({
    required String title,
    required String description,
    required context
}){
 if(time !=null && startDate != null && endDate != null && title.isNotEmpty  && description.isNotEmpty){
   notes.add(NoteModel(
       title: title,
       time: time!.format(context),
       description: description,
       startDate: convertDate(startDate!),
       endDate: convertDate(endDate!)));
   restData();
   notifyListeners();
   Navigator.pop(context);
 }
 else{
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppTexts.fillYourDetails)));
 }
  }
  removeNote(int index,context){
    notes.removeAt(index);
    Navigator.pop(context);
    Navigator.pop(context);
    notifyListeners();
  }

  updateDone(int index){
    notes[index].doneOrNot = !notes[index].doneOrNot;
    notifyListeners();
  }
  updateArchive(int index){
    notes[index].archiveOrNot = !notes[index].archiveOrNot;
    notifyListeners();
  }

  DateTime date = DateTime.now();
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();
  TimeOfDay? time ;

  selectStartDate(context)async{
    startDate = await showDatePicker(context: context, firstDate: date, lastDate: date.add(Duration(days: 365)));
    notifyListeners();
  }
  selectEndDate(context)async{
    endDate = await showDatePicker(context: context, firstDate: date, lastDate: date.add(Duration(days: 365)));
    notifyListeners();
  }
  selectTime(context)async{
    time =await showTimePicker(context: context, initialTime: TimeOfDay.now());
    notifyListeners();
  }
  restData(){
     date = DateTime.now();
     startDate = DateTime.now();
     endDate = DateTime.now();
     time = null ;
  }
}