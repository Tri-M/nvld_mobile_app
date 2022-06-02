import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  double? height;
  double? width;
  List<double> presetFontSizes;
  TextStyle? style;
  int? maxlines;
  TextAlign? textAlign;

  TextContainer(
      {required this.text,
      required this.presetFontSizes,
      this.height,
      this.width,
      this.style,
      this.maxlines,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: AutoSizeText(
          text,
          presetFontSizes: presetFontSizes,
          style: style,
          textAlign: textAlign,
          maxLines: maxlines,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
