// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/comment_model.dart';
import '../../models/post_model.dart';

class CommentTile extends StatelessWidget {
  CommentTile({Key? key, required this.dataComment}) : super(key: key);
  Comment dataComment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // NOTE : Tidak ada data user yang mengomentari post
            Container(
              width: 70,
              child: Text(
                "Unknown",
                // dataPost.comment![i].name.toString(),
                style: mainTextStyle.copyWith(
                  color: kBlackColor,
                  fontWeight: extraBold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                dataComment.body.toString(),
                style: mainTextStyle.copyWith(
                  color: kCloudyGrayColor,
                  fontWeight: semiBold,
                  fontSize: regularFontSize,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
