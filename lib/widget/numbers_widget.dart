import 'package:flutter/material.dart';
import 'package:nvld_app/components/text_container.dart';
import 'package:nvld_app/constants.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(context, '16', 'Latest score'),
        buildDivider(),
        buildButton(context, '39.7', 'Ranking'),
        buildDivider(),
        buildButton(context, '18', 'Best score'),
      ],
    );
  }

  Widget buildDivider() {
    return Container(
      height: 24,
      child: VerticalDivider(
        color: dividerColor,
        thickness: 0.8,
      ),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextContainer(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            presetFontSizes: [24, 22, 20, 18, 16],
          ),
          SizedBox(
            height: 2,
          ),
          TextContainer(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            presetFontSizes: [16, 14, 12, 10, 8],
          ),
        ],
      ),
    );
  }
}
