import 'package:flutter/material.dart';
import 'package:logistics_now/core/constants/app_assets_path.dart';
import 'package:logistics_now/core/theme/widgets_and_attributes.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssetsPath.noResultsIcon,
              height: 60,
            ),
            sizedBoxH8,
            const Text(
              "No data found",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
