// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cinta_coding/ui/widgets/appbar.dart';
import 'package:cinta_coding/ui/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/post_model.dart';

class DetilPosting extends StatelessWidget {
  DetilPosting({
    Key? key,
    this.dataPost,
  }) : super(key: key);

  final Post? dataPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        'Detil Posting',
        context,
      ),
      body: PostTile(
        dataPost: dataPost!,
        isDetilPosting: true,
      ),
    );
  }
}
