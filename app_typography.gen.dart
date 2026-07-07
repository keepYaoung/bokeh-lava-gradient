// GENERATED CODE - DO NOT MODIFY BY HAND
// Design Token Generator (Token Press / DTCG)
// Source: assets/design/typography.json
// ignore_for_file: type=lint

import 'package:flutter/material.dart';

/// Root typography tokens — wired via ThemeExtension.
///
/// Usage: `Theme.of(context).extension<AppTypography>()!.display.small4`
@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.display,
    required this.title1,
    required this.title2,
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.body1,
    required this.body2,
    required this.caption1,
    required this.caption2,
    required this.caption3,
    required this.badge,
    required this.widget,
  });

  final AppTypographyDisplay display;
  final AppTypographyTitle1 title1;
  final AppTypographyTitle2 title2;
  final AppTypographyHeading1 heading1;
  final AppTypographyHeading2 heading2;
  final AppTypographyHeading3 heading3;
  final AppTypographyHeading4 heading4;
  final AppTypographyBody1 body1;
  final AppTypographyBody2 body2;
  final AppTypographyCaption1 caption1;
  final AppTypographyCaption2 caption2;
  final AppTypographyCaption3 caption3;
  final AppTypographyBadge badge;
  final AppTypographyWidget widget;

  static const AppTypography standard = AppTypography(
    display: AppTypographyDisplay.standard,
    title1: AppTypographyTitle1.standard,
    title2: AppTypographyTitle2.standard,
    heading1: AppTypographyHeading1.standard,
    heading2: AppTypographyHeading2.standard,
    heading3: AppTypographyHeading3.standard,
    heading4: AppTypographyHeading4.standard,
    body1: AppTypographyBody1.standard,
    body2: AppTypographyBody2.standard,
    caption1: AppTypographyCaption1.standard,
    caption2: AppTypographyCaption2.standard,
    caption3: AppTypographyCaption3.standard,
    badge: AppTypographyBadge.standard,
    widget: AppTypographyWidget.standard,
  );

  @override
  AppTypography copyWith({
    AppTypographyDisplay? display,
    AppTypographyTitle1? title1,
    AppTypographyTitle2? title2,
    AppTypographyHeading1? heading1,
    AppTypographyHeading2? heading2,
    AppTypographyHeading3? heading3,
    AppTypographyHeading4? heading4,
    AppTypographyBody1? body1,
    AppTypographyBody2? body2,
    AppTypographyCaption1? caption1,
    AppTypographyCaption2? caption2,
    AppTypographyCaption3? caption3,
    AppTypographyBadge? badge,
    AppTypographyWidget? widget,
  }) {
    return AppTypography(
      display: display ?? this.display,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      caption3: caption3 ?? this.caption3,
      badge: badge ?? this.badge,
      widget: widget ?? this.widget,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return t < 0.5 ? this : other;
  }
}

/// Display
@immutable
class AppTypographyDisplay {
  const AppTypographyDisplay({
    required this.semibold4,
    required this.medium4,
  });

  /// semibold-4%
  final TextStyle semibold4;
  /// medium-4%
  final TextStyle medium4;

  static const AppTypographyDisplay standard = AppTypographyDisplay(
    semibold4: TextStyle(fontFamily: 'Geist', fontSize: 24.0, fontWeight: FontWeight.w600, height: 1.458, letterSpacing: -0.2304),
    medium4: TextStyle(fontFamily: 'Geist', fontSize: 24.0, fontWeight: FontWeight.w500, height: 1.458, letterSpacing: -0.2304),
  );
}

/// Title1
@immutable
class AppTypographyTitle1 {
  const AppTypographyTitle1({
    required this.bold,
    required this.semibold,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;

  static const AppTypographyTitle1 standard = AppTypographyTitle1(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 32.0, fontWeight: FontWeight.w700, height: 1.188, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 32.0, fontWeight: FontWeight.w600, height: 1.188, letterSpacing: 0.0),
  );
}

/// Title2
@immutable
class AppTypographyTitle2 {
  const AppTypographyTitle2({
    required this.bold,
    required this.semibold,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;

  static const AppTypographyTitle2 standard = AppTypographyTitle2(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 28.0, fontWeight: FontWeight.w700, height: 1.214, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 28.0, fontWeight: FontWeight.w600, height: 1.214, letterSpacing: 0.0),
  );
}

/// Heading1
@immutable
class AppTypographyHeading1 {
  const AppTypographyHeading1({
    required this.bold,
    required this.semibold,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;

  static const AppTypographyHeading1 standard = AppTypographyHeading1(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 24.0, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 24.0, fontWeight: FontWeight.w600, height: 1.25, letterSpacing: 0.0),
  );
}

/// Heading2
@immutable
class AppTypographyHeading2 {
  const AppTypographyHeading2({
    required this.bold,
    required this.boldReading,
  });

  /// bold
  final TextStyle bold;
  /// bold reading
  final TextStyle boldReading;

  static const AppTypographyHeading2 standard = AppTypographyHeading2(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 22.0, fontWeight: FontWeight.w700, height: 1.273, letterSpacing: 0.0),
    boldReading: TextStyle(fontFamily: 'Geist', fontSize: 22.0, fontWeight: FontWeight.w700, height: 1.364, letterSpacing: 0.0),
  );
}

/// Heading3
@immutable
class AppTypographyHeading3 {
  const AppTypographyHeading3({
    required this.bold,
    required this.semibold,
    required this.medium,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;
  /// medium
  final TextStyle medium;

  static const AppTypographyHeading3 standard = AppTypographyHeading3(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 20.0, fontWeight: FontWeight.w700, height: 1.3, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 20.0, fontWeight: FontWeight.w600, height: 1.3, letterSpacing: 0.0),
    medium: TextStyle(fontFamily: 'Geist', fontSize: 20.0, fontWeight: FontWeight.w500, height: 1.3, letterSpacing: 0.0),
  );
}

/// Heading4
@immutable
class AppTypographyHeading4 {
  const AppTypographyHeading4({
    required this.bold,
    required this.semibold,
    required this.medium,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;
  /// medium
  final TextStyle medium;

  static const AppTypographyHeading4 standard = AppTypographyHeading4(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 18.0, fontWeight: FontWeight.w700, height: 1.222, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 18.0, fontWeight: FontWeight.w600, height: 1.222, letterSpacing: 0.0),
    medium: TextStyle(fontFamily: 'Geist', fontSize: 18.0, fontWeight: FontWeight.w500, height: 1.222, letterSpacing: 0.0),
  );
}

/// Body1
@immutable
class AppTypographyBody1 {
  const AppTypographyBody1({
    required this.bold,
    required this.semibold,
    required this.medium,
    required this.regular,
    required this.mediumReading,
    required this.regularReading,
  });

  /// bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;
  /// medium
  final TextStyle medium;
  /// regular
  final TextStyle regular;
  /// medium_reading
  final TextStyle mediumReading;
  /// regular_reading
  final TextStyle regularReading;

  static const AppTypographyBody1 standard = AppTypographyBody1(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w700, height: 1.375, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w600, height: 1.375, letterSpacing: 0.0),
    medium: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w500, height: 1.375, letterSpacing: 0.0),
    regular: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w400, height: 1.375, letterSpacing: 0.0),
    mediumReading: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w500, height: 1.5, letterSpacing: 0.0),
    regularReading: TextStyle(fontFamily: 'Geist', fontSize: 16.0, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.0),
  );
}

/// Body2
@immutable
class AppTypographyBody2 {
  const AppTypographyBody2({
    required this.semibold,
    required this.medium,
    required this.medium4,
    required this.regular,
    required this.regularTime,
    required this.light4,
  });

  /// semibold
  final TextStyle semibold;
  /// medium
  final TextStyle medium;
  /// medium_4%
  final TextStyle medium4;
  /// regular
  final TextStyle regular;
  /// regular_(time)
  final TextStyle regularTime;
  /// light_4%
  final TextStyle light4;

  static const AppTypographyBody2 standard = AppTypographyBody2(
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w600, height: 1.286, letterSpacing: 0.0),
    medium: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w500, height: 1.286, letterSpacing: 0.0),
    medium4: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w500, height: 1.429, letterSpacing: 0.07840000000000001),
    regular: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w400, height: 1.286, letterSpacing: 0.0),
    regularTime: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w400, height: 1.571, letterSpacing: 0.0294),
    light4: TextStyle(fontFamily: 'Geist', fontSize: 14.0, fontWeight: FontWeight.w300, height: 1.429, letterSpacing: 0.07840000000000001),
  );
}

/// Caption1
@immutable
class AppTypographyCaption1 {
  const AppTypographyCaption1({
    required this.bold,
    required this.semibold,
    required this.medium,
  });

  /// Bold
  final TextStyle bold;
  /// semibold
  final TextStyle semibold;
  /// medium
  final TextStyle medium;

  static const AppTypographyCaption1 standard = AppTypographyCaption1(
    bold: TextStyle(fontFamily: 'Geist', fontSize: 12.0, fontWeight: FontWeight.w700, height: 1.167, letterSpacing: 0.0),
    semibold: TextStyle(fontFamily: 'Geist', fontSize: 12.0, fontWeight: FontWeight.w600, height: 1.167, letterSpacing: 0.0),
    medium: TextStyle(fontFamily: 'Geist', fontSize: 12.0, fontWeight: FontWeight.w500, height: 1.167, letterSpacing: 0.0),
  );
}

/// Caption2
@immutable
class AppTypographyCaption2 {
  const AppTypographyCaption2({
    required this.medium,
    required this.widget,
  });

  /// medium
  final TextStyle medium;
  /// widget
  final TextStyle widget;

  static const AppTypographyCaption2 standard = AppTypographyCaption2(
    medium: TextStyle(fontFamily: 'Geist', fontSize: 11.0, fontWeight: FontWeight.w500, height: 1.273, letterSpacing: 0.0),
    widget: TextStyle(fontFamily: 'Geist', fontSize: 11.0, fontWeight: FontWeight.w500, height: 1.091, letterSpacing: 0.0),
  );
}

/// Caption3
@immutable
class AppTypographyCaption3 {
  const AppTypographyCaption3({
    required this.medium,
  });

  /// medium
  final TextStyle medium;

  static const AppTypographyCaption3 standard = AppTypographyCaption3(
    medium: TextStyle(fontFamily: 'Geist', fontSize: 10.0, fontWeight: FontWeight.w500, height: 1.4, letterSpacing: 0.04),
  );
}

/// Badge
@immutable
class AppTypographyBadge {
  const AppTypographyBadge({
    required this.medium4,
  });

  /// medium_4%
  final TextStyle medium4;

  static const AppTypographyBadge standard = AppTypographyBadge(
    medium4: TextStyle(fontFamily: 'Geist', fontSize: 10.0, fontWeight: FontWeight.w500, height: 1.2, letterSpacing: 0.04),
  );
}

/// Widget
@immutable
class AppTypographyWidget {
  const AppTypographyWidget({
    required this.regular,
  });

  /// regular
  final TextStyle regular;

  static const AppTypographyWidget standard = AppTypographyWidget(
    regular: TextStyle(fontFamily: 'Geist', fontSize: 9.0, fontWeight: FontWeight.w400, height: 1.333, letterSpacing: 0.0),
  );
}

