// ignore_for_file: unnecessary_this, prefer_if_null_operators

import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final TextStyle? styleTitle;
  final double width;
  final double? height;
  final Function() onPress;
  final EdgeInsets? margin, titleMargin;
  final EdgeInsets padding;
  final Color? color;
  final Widget? iconButton, iconButtonBefore;
  final bool? isEnabled;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton({
    Key? key,
    required this.title,
    this.styleTitle,
    this.height,
    this.titleMargin,
    this.width = double.infinity,
    required this.onPress,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.color,
    this.iconButton,
    this.iconButtonBefore,
    this.isEnabled,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled != null && isEnabled == false) {
          return;
        }
        this.onPress();
      },
      child: Container(
        width: this.width,
        height: height != null ? height : 55,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: isEnabled != null && isEnabled == false
              ? kCloudyGrayColor
              : color ?? kBluePrimaryColor,
          borderRadius: this.borderRadius ??
              BorderRadius.circular(
                defaultRadius,
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconButtonBefore != null ? iconButtonBefore! : Container(),
            Container(
              margin: titleMargin,
              child: Text(
                this.title,
                style: styleTitle ??
                    mainTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                      color: kWhitePrimaryColor,
                    ),
              ),
            ),
            iconButton != null ? iconButton! : Container(),
          ],
        ),
      ),
    );
  }
}
