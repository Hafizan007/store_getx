import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFFFFFF); //White Background
const kBlack = Color(0xFF181818);
const kBlack2 = Color(0xFF384354);
const kPrimaryColor = Color(0xFFffae10);
const kSecondaryColor = Color(0xFFfaf9f9);
const kTextColor = Color(0xFF7a838c); //Black Color
const kTextLightColor = Color(0xFFFE7B41);
const kTextPinkColor = Color(0xFFA08B8B);
const kWhiteColor = Color(0xFFF7F7F7);
const kPinkLightColor = Color(0xFFF0E2E2);
const kPinkFavColor = Color(0xFFef144a);
const kPOrangeColor = Color(0xFFf29f0f);
const kPOrangeColor2 = Color(0xFFfceccf);
const kPinkStrongColor = Color(0xFFE2C6C6);
const kBlueColor = Color(0xFF624cff);
const kBlueColor2 = Color(0xFF161a1e);
const kYellowColor = Color(0xFFFFC56D);
const kLightBlueColor = Color(0xFFe5f7ff);
const kGreyColor = Color(0xFF7c858e);
const kGreyColor2 = Color(0xFFeff0f1);
const kGSecondGreyColor = Color(0xFFE5E5E5);
const kDarkGreyColor = Color(0xFF757575);
const kSelectItemColor = Color(0xFF35485d);
const kDeepBlueColor = Color(0xFF594CF5);
const kRedColor = Color(0xFFfc0f03);
const kGreenColor = Color(0xFF9DE719);
const kGreenColor2 = Color(0xFF07c460);
const kGreenColor3 = Color(0xFF4AD887);
const kDarkButtonBg = Color(0xFF273546);
const kTabBarBg = Color(0xFFEEEEEE);
const kTextBlueColor = Color(0xFF5594bf);
const kWhite = Color(0xFFF4F4F4);
const kWhitebutton = Color(0xFFebedef);

TextStyle boldStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w700);
}

TextStyle superboldStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w800);
}

TextStyle mediumStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w500);
}

TextStyle semiBoldStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w600);
}

TextStyle lightStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w300);
}

TextStyle regularStyle(double fontsize, {Color mycolor = kBlack}) {
  return TextStyle(
      color: mycolor, fontSize: fontsize, fontWeight: FontWeight.w400);
}

SizedBox marginHeight(double val) {
  return SizedBox(
    height: val,
  );
}

SizedBox marginWidth(double val) {
  return SizedBox(
    width: val,
  );
}

EdgeInsets horizontalPadding(double size) =>
    EdgeInsets.symmetric(horizontal: size);

EdgeInsets verticalPadding(double size) => EdgeInsets.symmetric(vertical: size);

ButtonStyle buttonStyle(Color primary) {
  return ElevatedButton.styleFrom(
      primary: primary,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)));
}

ButtonStyle buttonStyleV2(Color primary) {
  return ElevatedButton.styleFrom(
      primary: primary,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)));
}
