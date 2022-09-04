// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cinta_coding/enum/type_textfield.dart';
import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    Key? key,
    this.margin,
    this.textField,
    this.hintText,
    this.hintStyle,
    this.type,
    this.onChange,
    this.padding,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final TextEditingController? textField;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextfieldType? type;
  final Function? onChange;
  final EdgeInsets? padding;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isHomepageType() {
    return widget.type != null
        ? (widget.type == TextfieldType.homepage ? true : false)
        : false;
  }

  @override
  Widget build(BuildContext context) {
    if (isHomepageType()) {
      return Padding(
        padding: widget.padding ?? EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kFogGrayColor,
          ),
          child: Container(
            margin: widget.margin,
            child: TextField(
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: regularFontSize,
                color: kBlackColor,
              ),
              enabled: true,
              controller: widget.textField,
              autofocus: false,
              onChanged: (val) {
                setState(() {
                  widget.onChange!(val);
                });
              },
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                suffixIcon: Icon(Icons.search),
                hintStyle: mainTextStyle.copyWith(
                  fontSize: regularFontSize,
                  fontWeight: semiBold,
                  color: kMetalGrayColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: widget.margin,
      child: TextField(
        textAlign: TextAlign.center,
        controller: widget.textField,
        // ignore: unnecessary_new
        decoration: new InputDecoration(
          hintStyle: widget.hintStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            borderSide: BorderSide(
              color: kBluePrimaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            borderSide: BorderSide(
              color: kBluePrimaryColor.withOpacity(0.3),
              width: 1.0,
            ),
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
