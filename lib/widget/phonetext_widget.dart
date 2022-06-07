import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';

class PhoneTextWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final Icon icon;
  final String text;
  final ValueChanged<String> onChanged;

  const PhoneTextWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.icon,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneTextWidget> createState() => _PhoneTextWidgetState();
}

class _PhoneTextWidgetState extends State<PhoneTextWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContainer(
          text: widget.label,
          style: const TextStyle(
            color: Color.fromARGB(255, 50, 0, 75),
            fontWeight: FontWeight.bold,
          ),
          presetFontSizes: [20, 18, 16, 14],
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          cursorColor: kPrimaryColor,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2,
              ),
            ),
          ),
          autofocus: true,
          controller: controller,
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}
