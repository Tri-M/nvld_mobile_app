class Question{
  String question;
  String? image;
  List<String> options;
  int answer;
  int? selected;
  bool submitted=false;
  String type; //text or image or video
  String? media;
  Question({required this.question,required this.answer,required this.options,this.image,required this.type,this.media});
  
}