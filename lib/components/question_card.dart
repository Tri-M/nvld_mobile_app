import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:nvld_app/components/common_button.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:video_player/video_player.dart';

import '../models/Question.dart';

class QuestionCard extends StatefulWidget {
  Question question;
  QuestionCard({required this.question});
  @override
  State<QuestionCard> createState() => _QuestionCardState(question: question);
}

class _QuestionCardState extends State<QuestionCard> {
  Question question;
  late VideoPlayerController videoController;
  late ChewieController _chewieController;
  bool showQuestion = true;
  _QuestionCardState({required this.question});
  @override
  void initState() {
    super.initState();
    if (question.type == 'video') {
      videoController = VideoPlayerController.network(question.media!)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _chewieController = ChewieController(
        videoPlayerController: videoController,
        // aspectRatio: videoController.value.aspectRatio,
        autoPlay: true,
        autoInitialize: true,
        // looping: widget.looping,
        allowFullScreen: true,
        allowMuting: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );

      videoController.play();
    }
    
  }
  @override
  void didUpdateWidget(QuestionCard oldWidget){
    super.didUpdateWidget(oldWidget);
    print(widget.question.type);
    if (widget.question.type == 'video') {
      videoController = VideoPlayerController.network(widget.question.media!)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _chewieController = ChewieController(
        videoPlayerController: videoController,
        // aspectRatio: videoController.value.aspectRatio,
        autoPlay: true,
        autoInitialize: true,
        // looping: widget.looping,
        allowFullScreen: true,
        allowMuting: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );

      videoController.play();
    }
  }
  
  

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    
    question = widget.question;

    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                1,
                3,
              ),
              blurRadius: 4,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            !showQuestion && question.type!='text'?question.type=='video'
                ? videoController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: Chewie(
                          controller: _chewieController,
                        ),
                      )
                    : Container():
                    Image.network(question.media!
                    ,width:width*0.9,fit:BoxFit.fill)
                : TextContainer(
                    text: question.question,
                    textAlign: TextAlign.start,
                    presetFontSizes: [22, 20, 18, 16, 14, 12, 10],
                    maxlines: 5,
                    width: width * 0.9,
                    height: height * 0.16,
                  ),
            if (question.type != 'text') SizedBox(height: height * 0.01),
            if (question.type != 'text')
              CommonButton(
                  height: height * 0.06,
                  width: width * 0.6,
                  text: showQuestion
                      ? question.type == 'video'
                          ? 'Watch Video'
                          : 'Show Image'
                      : 'Show Question',
                  onTap: () {
                    setState(() {
                      showQuestion = !showQuestion;
                    });
                  })
          ],
        ));
  }
}
