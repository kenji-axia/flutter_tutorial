import 'package:flutter/material.dart';

const double space0 = 0;
const double space2 = 2;
const double space4 = 4;
const double space8 = 8;
const double space16 = 16;
const double space24 = 24;
const double space32 = 32;
const double space48 = 48;
const double space64 = 64;
const double space96 = 96;
const double space128 = 128;

// Column等でスペース（高さ）を作るときに使用
const sizedBoxH2 = SizedBox(height: 2);
const sizedBoxH4 = SizedBox(height: 4);
const sizedBoxH8 = SizedBox(height: 8);
const sizedBoxH12 = SizedBox(height: 12);
const sizedBoxH16 = SizedBox(height: 16);
const sizedBoxH24 = SizedBox(height: 24);
const sizedBoxH32 = SizedBox(height: 32);

// Row等でスペース（横幅）を作るときに使用
const sizedBoxW2 = SizedBox(width: 2);
const sizedBoxW4 = SizedBox(width: 4);
const sizedBoxW8 = SizedBox(width: 8);
const sizedBoxW12 = SizedBox(width: 12);
const sizedBoxW16 = SizedBox(width: 16);
const sizedBoxW24 = SizedBox(width: 24);
const sizedBoxW32 = SizedBox(width: 32);

final borderRadius4 = BorderRadius.circular(4);
final borderRadius6 = BorderRadius.circular(6);
final borderRadius10 = BorderRadius.circular(10);
final borderRadius25 = BorderRadius.circular(25);

// TextStyle
const fontSize14TextStyle = TextStyle(
  fontSize: 14,
);
const fontWeight600TextStyle = TextStyle(
  fontWeight: FontWeight.w600,
);
const fontWeightBoldTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

const blueAccent = Colors.blueAccent;
const black87 = Colors.black87;
const white = Colors.white;
Color? grey400 = Colors.grey[400];
Color? grey600 = Colors.grey[600];
Color? grey700 = Colors.grey[700];

const residenceMainBackgroundColor = Color.fromRGBO(250, 248, 245, 1);
const residenceMainAccentColor = Color.fromRGBO(82, 164, 154, 1);

const mercariMainAccentColor = Color.fromRGBO(34, 34, 34, 1);
const mercariRedAccentColor = Color.fromRGBO(210, 82, 68, 1);
const mercariBodyTopBackgroundColor = Color.fromRGBO(239, 239, 239, 1);

// Tutorial9で使用する色
const whiteColor = Color(0xffffffff);
const calendarBackgroundColor = Color(0xfff4edea);
const calendarAccentColor = Color(0xffc5d8d1);
const calendarDarkBlueTextColor = Color(0xff12263a);
const calendarNormalTextColor = Color(0xff565656);
const calendarRadioColor = Color(0xff06bcc1);
const calendarTextStyle = TextStyle(
  color: calendarNormalTextColor,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
const editScheduleDialogActionButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: calendarDarkBlueTextColor,
);
// カレンダー設定
// カレンダーは今日を基準に前後10年分表示
final today = DateTime.now();
const pastYearLength = 10;
const futureYearLength = 10;
final calendarFirstDay =
    DateTime(today.year - pastYearLength, today.month, today.day);
final calendarLastDay =
    DateTime(today.year + futureYearLength, today.month, today.day);

// 以下 Tutorial2.2以前で使用
const sizedBox4 = SizedBox(height: 4, width: 4);
const sizedBox8 = SizedBox(height: 8, width: 8);
const sizedBox16 = SizedBox(height: 16, width: 16);
const fontSize14 = TextStyle(fontSize: 14);

// 以下、Tutorial8以前で使用
const double spacing0 = 0;
const double spacingMin = 2;
const double spacingHalf = 4;
const double spacing1 = 8;
const double spacing2 = 16;
const double spacing3 = 24;
const double spacing4 = 32;
const double spacing5 = 48;
const double spacing6 = 64;
const double spacing7 = 96;
const double spacing8 = 128;
