class Question{
  String question;
  List<String> options;
  int answer;
  int? selected;
  bool submitted=false;
  String type; //text or image or video
  String? media;
  Question({required this.question,required this.answer,required this.options,required this.type,this.media});
  
}