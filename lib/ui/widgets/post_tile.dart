// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cinta_coding/providers/home_provider.dart';
import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/post_model.dart';
import '../../providers/login_provider.dart';
import '../pages/detil_posting.dart';
import 'comment_tile.dart';

class PostTile extends StatelessWidget {
  PostTile({
    Key? key,
    required this.dataPost,
    this.isDetilPosting,
  }) : super(key: key);

  final Post dataPost;
  final bool? isDetilPosting;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDetilPosting == true) {
          return;
        }
        HomeProvider prov = Provider.of<HomeProvider>(context, listen: false);
        prov.isAllComment = false;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new DetilPosting(
              dataPost: dataPost,
            ),
          ),
        );
      },
      child: Container(
        color: kTransparentColor,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 10,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: isDetilPosting == null
              ? NeverScrollableScrollPhysics()
              : ScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userPost(),
                const SizedBox(
                  width: 10,
                ),
                contentPost(),
              ],
            ),
            isDetilPosting == false || isDetilPosting == null
                ? SizedBox()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allCommentButton(),
                      commentView(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget allCommentButton() {
    return Consumer<HomeProvider>(
      builder: (_, data, ch) => data.isAllComment == true
          ? SizedBox()
          : GestureDetector(
              onTap: () {
                if (!data.isAllComment) {
                  data.isAllComment = true;
                }
              },
              child: Container(
                color: kTransparentColor,
                margin: EdgeInsets.only(
                  left: 70,
                  bottom: 10,
                ),
                child: Text(
                  "All Comment",
                  style: mainTextStyle.copyWith(
                    color: kMetalGrayColor,
                    fontWeight: bold,
                    fontSize: regularFontSize,
                  ),
                ),
              ),
            ),
    );
  }

  Widget userPost() {
    return Consumer<LoginProvider>(
      builder: (_, data, ch) => Container(
        margin: const EdgeInsets.only(top: 2.5),
        width: 60,
        child: Text(
          data.showNameByID(dataPost.userId!),
          style: mainTextStyle.copyWith(
            color: kBlackColor,
            fontWeight: extraBold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget contentPost() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataPost.title.toString(),
            style: mainTextStyle.copyWith(
              color: kMetalGrayColor,
              fontWeight: semiBold,
              fontSize: regularFontSize,
            ),
            maxLines: 2,
          ),
          SizedBox(
            height: 10,
          ),
          isDetilPosting == true
              ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    dataPost.body.toString(),
                    style: mainTextStyle.copyWith(
                      color: kCloudyGrayColor,
                      fontWeight: semiBold,
                      fontSize: regularFontSize,
                    ),
                    maxLines: 2,
                  ),
                )
              : const SizedBox(
                  height: 0,
                ),
          isDetilPosting == true
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: kBluePrimaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      dataPost.countComment().toString(),
                      style: mainTextStyle.copyWith(
                        color: kBluePrimaryColor,
                        fontWeight: semiBold,
                        fontSize: regularFontSize,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Detail",
                      style: mainTextStyle.copyWith(
                        color: kBluePrimaryColor,
                        fontWeight: semiBold,
                        fontSize: regularFontSize,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget commentView() {
    return Container(
      margin: EdgeInsets.only(left: 70),
      child: Consumer<HomeProvider>(
        builder: (_, data, ch) => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // itemCount: dataPost.countComment(),
          itemCount: data.countComment(dataPost.comment),
          itemBuilder: (context, i) {
            return CommentTile(
              dataComment: dataPost.comment![i],
            );
          },
        ),
      ),
    );
  }
}
