// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileTile extends StatelessWidget {
  ProfileTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 90,
            child: Text(
              title,
              style: mainTextStyle.copyWith(
                color: kCloudyGrayColor,
                fontWeight: semiBold,
                fontSize: regularFontSize,
              ),
            ),
          ),
          const Text(" : "),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                value,
                style: mainTextStyle.copyWith(
                  color: kBlackColor,
                  fontWeight: semiBold,
                  fontSize: regularFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
