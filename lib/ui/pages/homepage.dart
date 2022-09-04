// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:cinta_coding/enum/type_textfield.dart';
import 'package:cinta_coding/shared/themes.dart';
import 'package:cinta_coding/ui/widgets/appbar.dart';
import 'package:cinta_coding/ui/widgets/custom_textfield.dart';
import 'package:cinta_coding/ui/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../providers/home_provider.dart';
import '../../providers/login_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController search = TextEditingController(text: '');

  void searchOnChanged(String val) {
    setState(() {
      search.text = val;
      search.selection = TextSelection.fromPosition(
        TextPosition(
          offset: search.text.length,
        ),
      );
    });
  }

  bool searchIsNotEmpty() {
    return search.text.toString() != "" ? true : false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeProvider prov = Provider.of<HomeProvider>(
      context,
      listen: false,
    );
    prov.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        'Cinta Coding',
        context,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(),
          searchField(),
          searchIsNotEmpty() ? contentDataBySearch(search.text) : contentData(),
        ],
      ),
    );
  }

  Widget heading() {
    return Consumer<LoginProvider>(
      builder: (_, data, ch) => Container(
        margin: EdgeInsets.only(left: 18, top: 18),
        child: Row(
          children: [
            Text(
              'Welcome, ',
              style: mainTextStyle.copyWith(
                color: kBlackColor,
                fontWeight: extraBold,
                fontSize: defaultFontSize,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed(
                  '/detil_profile',
                );
              },
              child: Container(
                color: kTransparentColor,
                child: Text(
                  data.dataUser!.name ?? '',
                  style: mainTextStyle.copyWith(
                    color: kBluePrimaryColor,
                    fontWeight: extraBold,
                    fontSize: defaultFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return CustomTextfield(
      onChange: (val) {
        // NOTE : Search menggunakan semua data lokal post yang telah diambil, karena api yang existing tidak menyediakan api search
        searchOnChanged(val);
      },
      textField: search,
      type: TextfieldType.homepage,
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      hintText: 'Search',
      hintStyle: TextStyle(
        color: kCloudyGrayColor,
        fontSize: 18,
      ),
    );
  }

  Widget contentData() {
    return Expanded(
      child: Consumer<HomeProvider>(
        builder: (_, data, ch) => ListView.builder(
          // ignore: prefer_const_literals_to_create_immutables
          itemCount: data.countPost(),
          itemBuilder: (context, i) {
            Post _dataPost = data.listPost![i];
            return PostTile(
              dataPost: _dataPost,
            );
          },
        ),
      ),
    );
  }

  Widget contentDataBySearch(String val) {
    return Expanded(
      child: Consumer<HomeProvider>(
        builder: (_, data, ch) => ListView.builder(
          // ignore: prefer_const_literals_to_create_immutables
          itemCount: data.countPostByText(val, context),
          itemBuilder: (context, i) {
            Post _dataPost = data.listPostByText(val, context)![i];
            return PostTile(
              dataPost: _dataPost,
            );
          },
        ),
      ),
    );
  }
}
