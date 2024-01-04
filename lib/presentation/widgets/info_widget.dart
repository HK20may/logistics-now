import 'package:flutter/material.dart';
import 'package:logistics_now/core/theme/widgets_and_attributes.dart';

class InfoWidget extends StatelessWidget {
  final String textTitle;
  const InfoWidget({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBoxH8,
        Row(
          children: [
            sizedBoxW4,
            Icon(
              Icons.info_outline_rounded,
              color: Colors.red[700],
            ),
            sizedBoxW8,
            Text(
              textTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.red[600]),
            ),
          ],
        ),
      ],
    );
  }
}
