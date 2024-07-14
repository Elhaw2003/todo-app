class NoteModel{
   final String title;
   final String description;
   bool doneOrNot;
   bool archiveOrNot;
   final String time;
   final String startDate;
   final String endDate;


   NoteModel({
     required this.title,
     required this.time,
     required this.description,
     required this.startDate,
     required this.endDate,
     this.doneOrNot = false,
     this.archiveOrNot=false
});
}