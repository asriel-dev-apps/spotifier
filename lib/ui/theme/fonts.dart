import 'package:flutter/material.dart';
import 'package:spotifier/ui/theme/sizes.dart';

/// フォント
class AppFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class AppText {
  static const titleL = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleS = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: AppFont.general,
    fontWeight: FontWeight.bold,
  );
  static const bodyL = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: AppFont.general,
  );
  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: AppFont.general,
  );
  static const bodyS = TextStyle(
    fontSize: RawSize.p14,
    fontFamily: AppFont.general,
  );
}
