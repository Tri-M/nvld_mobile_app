import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nvld_app/components/common_button.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';
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
  VideoPlayerController? videoController;
  late ChewieController _chewieController;
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
        videoPlayerController: videoController!,
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

      videoController!.play();
    }
  }

  @override
  void didUpdateWidget(QuestionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print(widget.question.type);
    if (widget.question.type == 'video') {
      videoController = VideoPlayerController.network(widget.question.media!)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _chewieController = ChewieController(
        videoPlayerController: videoController!,
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

      videoController!.play();
    }
  }

  @override
  void dispose() {
    super.dispose();
    // videoController!.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    question = widget.question;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      // height:height*2,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height*0.01),
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
            TextContainer(
              text: question.question,
              textAlign: TextAlign.start,
              presetFontSizes: [18, 16, 14, 12, 10],
              maxlines: 5,
              width: width * 0.9,
              // height: height * 0.16,
            ),
            SizedBox(height:height*0.02),
            if (question.type == 'video')
              videoController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController!.value.aspectRatio,
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    )
                  : Container(
                      child: SpinKitFadingCircle(
                      color: primaryPurple,
                      size: width * 0.3,
                    )),
            if (question.type == 'image')
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(question.media!,
                    width: width * 0.9,
                    
                    fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                        Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: height * 0.2,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryPurple,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                }),
              )
          ],
        ));
  }
}
