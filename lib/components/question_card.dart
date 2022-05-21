import 'package:flutter/material.dart';
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
  late VideoPlayerController _controller;
  _QuestionCardState({required this.question});
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
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
      child: question.type == 'text'
          ? TextContainer(
              text: question.question,
              textAlign: TextAlign.center,
              presetFontSizes: [30, 28, 26, 24, 22, 20, 18, 16, 14, 12, 10],
              maxlines: 5,
              width: width * 0.9,
              height: height * 0.16,
            )
          : _controller.value.isInitialized
              ? Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          child: Container(
                              width: width * 0.2,
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: width * 0.06,
                              )),
                        ),
                        SizedBox(width: width * 0.05),
                        InkWell(
                          onTap: () async {
                            await _controller.seekTo(Duration.zero);
                            setState(() {
                              _controller.play();
                            });
                          },
                          child: Container(
                              width: width * 0.2,
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.replay,
                                size: width * 0.06,
                              )),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
    );
  }
}
