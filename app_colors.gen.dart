// GENERATED CODE - DO NOT MODIFY BY HAND
// Design Token Generator (Token Press / DTCG)
// Sources:
//   - assets/design/colors-light.json
//   - assets/design/colors-dark.json
// ignore_for_file: type=lint

import 'package:flutter/material.dart';

/// Root color tokens — wired to ThemeData via ThemeExtension.
///
/// Usage: `Theme.of(context).extension<AppColors>()!.pri.bg100`
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.semantic,
    required this.palette,
    required this.sdk,
  });

  final AppColorsSemantic semantic;
  final AppColorsPalette palette;
  final AppColorsSdk sdk;

  static const AppColors lightTheme = AppColors(
    semantic: AppColorsSemantic.lightTheme,
    palette: AppColorsPalette.lightTheme,
    sdk: AppColorsSdk.lightTheme,
  );

  static const AppColors darkTheme = AppColors(
    semantic: AppColorsSemantic.darkTheme,
    palette: AppColorsPalette.darkTheme,
    sdk: AppColorsSdk.darkTheme,
  );

  @override
  AppColors copyWith({
    AppColorsSemantic? semantic,
    AppColorsPalette? palette,
    AppColorsSdk? sdk,
  }) {
    return AppColors(
      semantic: semantic ?? this.semantic,
      palette: palette ?? this.palette,
      sdk: sdk ?? this.sdk,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      semantic: t < 0.5 ? semantic : other.semantic,
      palette: t < 0.5 ? palette : other.palette,
      sdk: t < 0.5 ? sdk : other.sdk,
    );
  }
}

/// Semantic
@immutable
class AppColorsSemantic {
  const AppColorsSemantic({
    required this.pri,
    required this.sec,
    required this.lbNormal,
    required this.lbAlternative,
    required this.bgNormal,
    required this.bgAlternative,
    required this.onColor,
    required this.gnb,
    required this.status,
    required this.static,
    required this.fill,
    required this.line,
    required this.material,
    required this.calendar,
    required this.orb,
  });

  final AppColorsSemanticPri pri;
  final AppColorsSemanticSec sec;
  final AppColorsSemanticLbNormal lbNormal;
  final AppColorsSemanticLbAlternative lbAlternative;
  final AppColorsSemanticBgNormal bgNormal;
  final AppColorsSemanticBgAlternative bgAlternative;
  final AppColorsSemanticOnColor onColor;
  final AppColorsSemanticGnb gnb;
  final AppColorsSemanticStatus status;
  final AppColorsSemanticStatic static;
  final AppColorsSemanticFill fill;
  final AppColorsSemanticLine line;
  final AppColorsSemanticMaterial material;
  final AppColorsSemanticCalendar calendar;
  final AppColorsSemanticOrb orb;

  static const AppColorsSemantic lightTheme = AppColorsSemantic(
    pri: AppColorsSemanticPri.lightTheme,
    sec: AppColorsSemanticSec.lightTheme,
    lbNormal: AppColorsSemanticLbNormal.lightTheme,
    lbAlternative: AppColorsSemanticLbAlternative.lightTheme,
    bgNormal: AppColorsSemanticBgNormal.lightTheme,
    bgAlternative: AppColorsSemanticBgAlternative.lightTheme,
    onColor: AppColorsSemanticOnColor.lightTheme,
    gnb: AppColorsSemanticGnb.lightTheme,
    status: AppColorsSemanticStatus.lightTheme,
    static: AppColorsSemanticStatic.lightTheme,
    fill: AppColorsSemanticFill.lightTheme,
    line: AppColorsSemanticLine.lightTheme,
    material: AppColorsSemanticMaterial.lightTheme,
    calendar: AppColorsSemanticCalendar.lightTheme,
    orb: AppColorsSemanticOrb.lightTheme,
  );

  static const AppColorsSemantic darkTheme = AppColorsSemantic(
    pri: AppColorsSemanticPri.darkTheme,
    sec: AppColorsSemanticSec.darkTheme,
    lbNormal: AppColorsSemanticLbNormal.darkTheme,
    lbAlternative: AppColorsSemanticLbAlternative.darkTheme,
    bgNormal: AppColorsSemanticBgNormal.darkTheme,
    bgAlternative: AppColorsSemanticBgAlternative.darkTheme,
    onColor: AppColorsSemanticOnColor.darkTheme,
    gnb: AppColorsSemanticGnb.darkTheme,
    status: AppColorsSemanticStatus.darkTheme,
    static: AppColorsSemanticStatic.darkTheme,
    fill: AppColorsSemanticFill.darkTheme,
    line: AppColorsSemanticLine.darkTheme,
    material: AppColorsSemanticMaterial.darkTheme,
    calendar: AppColorsSemanticCalendar.darkTheme,
    orb: AppColorsSemanticOrb.darkTheme,
  );
}

/// Semantic > Pri
@immutable
class AppColorsSemanticPri {
  const AppColorsSemanticPri({
    required this.bg50,
    required this.bg100,
    required this.bg200,
    required this.assistive,
    required this.normal,
    required this.strongCta,
    required this.accent,
    required this.bgButton20,
  });

  /// bg-50
  final Color bg50;
  /// bg-100
  final Color bg100;
  /// bg-200
  final Color bg200;
  /// assistive
  final Color assistive;
  /// normal
  final Color normal;
  /// strong-cta
  final Color strongCta;
  /// accent
  final Color accent;
  /// bg-button-20
  final Color bgButton20;

  static const AppColorsSemanticPri lightTheme = AppColorsSemanticPri(
    bg50: Color(0xFFFCF4F2),
    bg100: Color(0xFFFFEFE5),
    bg200: Color(0xFFFFDDD2),
    assistive: Color(0xFFFFB79E),
    normal: Color(0xFFFF7D50),
    strongCta: Color(0xFFFB6131),
    accent: Color(0xFFEC5019),
    bgButton20: Color(0x33EA5C30),
  );

  static const AppColorsSemanticPri darkTheme = AppColorsSemanticPri(
    bg50: Color(0xFF261A14),
    bg100: Color(0xFF3C2820),
    bg200: Color(0xFF442D22),
    assistive: Color(0xFFFFB79E),
    normal: Color(0xFFFF7D50),
    strongCta: Color(0xFFFF5926),
    accent: Color(0xFFE03A00),
    bgButton20: Color(0x33ED5323),
  );
}

/// Semantic > Sec
@immutable
class AppColorsSemanticSec {
  const AppColorsSemanticSec({
    required this.bg100,
    required this.bg200,
    required this.assistive,
    required this.neutral,
    required this.normal,
    required this.strong,
    required this.accent,
    required this.bgButton20,
  });

  /// bg-100
  final Color bg100;
  /// bg-200
  final Color bg200;
  /// assistive
  final Color assistive;
  /// neutral
  final Color neutral;
  /// normal
  final Color normal;
  /// strong
  final Color strong;
  /// accent
  final Color accent;
  /// bg-button-20
  final Color bgButton20;

  static const AppColorsSemanticSec lightTheme = AppColorsSemanticSec(
    bg100: Color(0xFFE9F3E1),
    bg200: Color(0xFFD9F9D1),
    assistive: Color(0xFF80D96B),
    neutral: Color(0xFF4CCA68),
    normal: Color(0xFF73C785),
    strong: Color(0xFF4EB137),
    accent: Color(0xFF66EB85),
    bgButton20: Color(0x334EB137),
  );

  static const AppColorsSemanticSec darkTheme = AppColorsSemanticSec(
    bg100: Color(0xFF36443B),
    bg200: Color(0xFF697A6F),
    assistive: Color(0xFF80D96B),
    neutral: Color(0xFF4CCA68),
    normal: Color(0xFF73C785),
    strong: Color(0xFF4EB137),
    accent: Color(0xFF66EB85),
    bgButton20: Color(0x334EB137),
  );
}

/// Semantic > LbNormal
@immutable
class AppColorsSemanticLbNormal {
  const AppColorsSemanticLbNormal({
    required this.strong,
    required this.normal,
    required this.neutral,
    required this.assistive,
    required this.alternative,
    required this.disable,
  });

  /// strong
  final Color strong;
  /// normal
  final Color normal;
  /// neutral
  final Color neutral;
  /// assistive
  final Color assistive;
  /// alternative
  final Color alternative;
  /// disable
  final Color disable;

  static const AppColorsSemanticLbNormal lightTheme = AppColorsSemanticLbNormal(
    strong: Color(0xFF1E1E1E),
    normal: Color(0xFF333333),
    neutral: Color(0xFF555555),
    assistive: Color(0xFF777777),
    alternative: Color(0xFF999999),
    disable: Color(0xFFCCCCCC),
  );

  static const AppColorsSemanticLbNormal darkTheme = AppColorsSemanticLbNormal(
    strong: Color(0xFFFFFFFF),
    normal: Color(0xFFEDEDED),
    neutral: Color(0xFFBFBFBF),
    assistive: Color(0xFF999999),
    alternative: Color(0xFF737373),
    disable: Color(0xFF595959),
  );
}

/// Semantic > LbAlternative
@immutable
class AppColorsSemanticLbAlternative {
  const AppColorsSemanticLbAlternative({
    required this.normal,
    required this.neutral,
    required this.assistive,
  });

  /// normal
  final Color normal;
  /// neutral
  final Color neutral;
  /// assistive
  final Color assistive;

  static const AppColorsSemanticLbAlternative lightTheme = AppColorsSemanticLbAlternative(
    normal: Color(0xFFFFFFFF),
    neutral: Color(0xFFF1F4F5),
    assistive: Color(0xFFEEEEEE),
  );

  static const AppColorsSemanticLbAlternative darkTheme = AppColorsSemanticLbAlternative(
    normal: Color(0xFF121212),
    neutral: Color(0xFF1F1F1F),
    assistive: Color(0xFF262626),
  );
}

/// Semantic > BgNormal
@immutable
class AppColorsSemanticBgNormal {
  const AppColorsSemanticBgNormal({
    required this.strong,
    required this.normal,
    required this.neutral,
    required this.assistive,
    required this.disabled,
    required this.toastWhite,
    required this.toastDimmer,
  });

  /// Strong
  final Color strong;
  /// normal
  final Color normal;
  /// neutral
  final Color neutral;
  /// assistive
  final Color assistive;
  /// disabled
  final Color disabled;
  /// toast-white
  final Color toastWhite;
  /// toast-dimmer
  final Color toastDimmer;

  static const AppColorsSemanticBgNormal lightTheme = AppColorsSemanticBgNormal(
    strong: Color(0xFFFDFDFD),
    normal: Color(0xFFF9F9F9),
    neutral: Color(0xFFF2F5F8),
    assistive: Color(0xFFF1F1F1),
    disabled: Color(0xFFFAFAFA),
    toastWhite: Color(0xFFFDFDFD),
    toastDimmer: Color(0xCC333333),
  );

  static const AppColorsSemanticBgNormal darkTheme = AppColorsSemanticBgNormal(
    strong: Color(0xFF0C0C0C),
    normal: Color(0xFF1F1F1F),
    neutral: Color(0xFF2C2C2C),
    assistive: Color(0xFF3A3A3A),
    disabled: Color(0xFF1E1E1E),
    toastWhite: Color(0xFF333333),
    toastDimmer: Color(0xD9FDFDFD),
  );
}

/// Semantic > BgAlternative
@immutable
class AppColorsSemanticBgAlternative {
  const AppColorsSemanticBgAlternative({
    required this.normal,
    required this.neutral,
    required this.assistive,
    required this.disabled,
    required this.toastWhite,
    required this.toastDimmer,
  });

  /// normal
  final Color normal;
  /// neutral
  final Color neutral;
  /// assistive
  final Color assistive;
  /// disabled
  final Color disabled;
  /// toast-white
  final Color toastWhite;
  /// toast-dimmer
  final Color toastDimmer;

  static const AppColorsSemanticBgAlternative lightTheme = AppColorsSemanticBgAlternative(
    normal: Color(0xFF121212),
    neutral: Color(0xFF1C1C1F),
    assistive: Color(0xFF262629),
    disabled: Color(0xFF1F1F1F),
    toastWhite: Color(0xFF333333),
    toastDimmer: Color(0xCCFDFDFD),
  );

  static const AppColorsSemanticBgAlternative darkTheme = AppColorsSemanticBgAlternative(
    normal: Color(0xFFFDFDFD),
    neutral: Color(0xFFF7F8FA),
    assistive: Color(0xFFF3F6F9),
    disabled: Color(0xFFFAFAFA),
    toastWhite: Color(0xFFFDFDFD),
    toastDimmer: Color(0xD9FDFDFD),
  );
}

/// Semantic > OnColor
@immutable
class AppColorsSemanticOnColor {
  const AppColorsSemanticOnColor({
    required this.lbStrong,
    required this.lbWarm,
    required this.lbCool,
    required this.lbAssistive,
    required this.lbAssistiveOpcity,
    required this.bgCompLighter,
    required this.bgCompLight,
    required this.bgCompDefault,
    required this.bgCompStrong,
    required this.bgAlternative1Default,
    required this.bgAlternative1Light,
    required this.bgAlternative1Lighter,
    required this.bgAlternative2Default,
    required this.bgAlternative2Strong,
    required this.strokeCompLighter,
    required this.strokeCompDefault,
    required this.status50,
  });

  /// lb-strong
  final Color lbStrong;
  /// lb-warm
  final Color lbWarm;
  /// lb-cool
  final Color lbCool;
  /// lb-assistive
  final Color lbAssistive;
  /// lb-assistive-opcity
  final Color lbAssistiveOpcity;
  /// bg-comp-lighter
  final Color bgCompLighter;
  /// bg-comp-light
  final Color bgCompLight;
  /// bg-comp-default
  final Color bgCompDefault;
  /// bg-comp-strong
  final Color bgCompStrong;
  /// bg-alternative1-default
  final Color bgAlternative1Default;
  /// bg-alternative1-light
  final Color bgAlternative1Light;
  /// bg-alternative1-lighter
  final Color bgAlternative1Lighter;
  /// bg-alternative2-default
  final Color bgAlternative2Default;
  /// bg-alternative2-strong
  final Color bgAlternative2Strong;
  /// stroke-comp-lighter
  final Color strokeCompLighter;
  /// stroke-comp-default
  final Color strokeCompDefault;
  /// status-50
  final Color status50;

  static const AppColorsSemanticOnColor lightTheme = AppColorsSemanticOnColor(
    lbStrong: Color(0xFFFFFDFB),
    lbWarm: Color(0xFFFFFDFB),
    lbCool: Color(0xFFFBFEFF),
    lbAssistive: Color(0xFFF5F5F5),
    lbAssistiveOpcity: Color(0x333A3A3A),
    bgCompLighter: Color(0x083A3A3A),
    bgCompLight: Color(0x0D3A3A3A),
    bgCompDefault: Color(0x333A3A3A),
    bgCompStrong: Color(0x4D3A3A3A),
    bgAlternative1Default: Color(0x333A3A3A),
    bgAlternative1Light: Color(0x1A3A3A3A),
    bgAlternative1Lighter: Color(0x0D3A3A3A),
    bgAlternative2Default: Color(0x80FDFDFD),
    bgAlternative2Strong: Color(0xFFFDFDFD),
    strokeCompLighter: Color(0x0D505050),
    strokeCompDefault: Color(0x1A505050),
    status50: Color(0x80FDFDFD),
  );

  static const AppColorsSemanticOnColor darkTheme = AppColorsSemanticOnColor(
    lbStrong: Color(0xFFFFFDFB),
    lbWarm: Color(0xFFFFFDFB),
    lbCool: Color(0xFFFBFEFF),
    lbAssistive: Color(0xFFF5F5F5),
    lbAssistiveOpcity: Color(0x4DF5F5F5),
    bgCompLighter: Color(0x1A3A3A3A),
    bgCompLight: Color(0x4D3A3A3A),
    bgCompDefault: Color(0x803A3A3A),
    bgCompStrong: Color(0xFF3A3A3A),
    bgAlternative1Default: Color(0x4DFDFDFD),
    bgAlternative1Light: Color(0x26FDFDFD),
    bgAlternative1Lighter: Color(0x1AFDFDFD),
    bgAlternative2Default: Color(0x4D3A3A3A),
    bgAlternative2Strong: Color(0xFF3A3A3A),
    strokeCompLighter: Color(0x4D505050),
    strokeCompDefault: Color(0xB3505050),
    status50: Color(0x803A3A3A),
  );
}

/// Semantic > Gnb
@immutable
class AppColorsSemanticGnb {
  const AppColorsSemanticGnb({
    required this.gray,
    required this.white,
  });

  /// gray
  final Color gray;
  /// white
  final Color white;

  static const AppColorsSemanticGnb lightTheme = AppColorsSemanticGnb(
    gray: Color(0xFFB8BCBE),
    white: Color(0xFFFFFFFF),
  );

  static const AppColorsSemanticGnb darkTheme = AppColorsSemanticGnb(
    gray: Color(0xFF8C8C91),
    white: Color(0xFFFFFFFF),
  );
}

/// Semantic > Status
@immutable
class AppColorsSemanticStatus {
  const AppColorsSemanticStatus({
    required this.suc,
    required this.wrn,
    required this.err,
  });

  /// suc
  final Color suc;
  /// wrn
  final Color wrn;
  /// err
  final Color err;

  static const AppColorsSemanticStatus lightTheme = AppColorsSemanticStatus(
    suc: Color(0xFF4CCE71),
    wrn: Color(0xFFFF9200),
    err: Color(0xFFFF5050),
  );

  static const AppColorsSemanticStatus darkTheme = AppColorsSemanticStatus(
    suc: Color(0xFF59D980),
    wrn: Color(0xFFFFA626),
    err: Color(0xFFFF6666),
  );
}

/// Semantic > Static
@immutable
class AppColorsSemanticStatic {
  const AppColorsSemanticStatic({
    required this.white,
    required this.black,
    required this.gray,
  });

  /// white
  final Color white;
  /// black
  final Color black;
  /// gray
  final Color gray;

  static const AppColorsSemanticStatic lightTheme = AppColorsSemanticStatic(
    white: Color(0xFFFDFDFD),
    black: Color(0xFF000000),
    gray: Color(0xFFC6C9D0),
  );

  static const AppColorsSemanticStatic darkTheme = AppColorsSemanticStatic(
    white: Color(0xFFFDFDFD),
    black: Color(0xFF000000),
    gray: Color(0xFFC6C9D0),
  );
}

/// Semantic > Fill
@immutable
class AppColorsSemanticFill {
  const AppColorsSemanticFill({
    required this.normal,
    required this.strong,
    required this.assistive,
  });

  /// normal
  final Color normal;
  /// strong
  final Color strong;
  /// assistive
  final Color assistive;

  static const AppColorsSemanticFill lightTheme = AppColorsSemanticFill(
    normal: Color(0xFFF6F6F6),
    strong: Color(0xFFF0F0F0),
    assistive: Color(0xFFF9F9F9),
  );

  static const AppColorsSemanticFill darkTheme = AppColorsSemanticFill(
    normal: Color(0xFF2E2E2E),
    strong: Color(0xFF383838),
    assistive: Color(0xFF242424),
  );
}

/// Semantic > Line
@immutable
class AppColorsSemanticLine {
  const AppColorsSemanticLine({
    required this.normal,
    required this.strong,
    required this.assistive,
  });

  /// normal
  final Color normal;
  /// strong
  final Color strong;
  /// assistive
  final Color assistive;

  static const AppColorsSemanticLine lightTheme = AppColorsSemanticLine(
    normal: Color(0xFFF6F6F6),
    strong: Color(0xFFE9E9E9),
    assistive: Color(0xFFF9F9F9),
  );

  static const AppColorsSemanticLine darkTheme = AppColorsSemanticLine(
    normal: Color(0xFF383838),
    strong: Color(0xFF474747),
    assistive: Color(0xFF2E2E2E),
  );
}

/// Semantic > Material
@immutable
class AppColorsSemanticMaterial {
  const AppColorsSemanticMaterial({
    required this.dimmer,
  });

  /// Dimmer
  final Color dimmer;

  static const AppColorsSemanticMaterial lightTheme = AppColorsSemanticMaterial(
    dimmer: Color(0x66000000),
  );

  static const AppColorsSemanticMaterial darkTheme = AppColorsSemanticMaterial(
    dimmer: Color(0xA6000000),
  );
}

/// Semantic > Calendar
@immutable
class AppColorsSemanticCalendar {
  const AppColorsSemanticCalendar({
    required this.tdy,
    required this.tdyLight,
    required this.checkFemale,
    required this.checkMale,
    required this.ovulationSoft,
    required this.ovulationMain,
    required this.ovulationTypo,
    required this.periodSoft,
    required this.periodMain,
    required this.periodTypo,
    required this.generalDay,
    required this.tdyStroke,
  });

  /// tdy
  final Color tdy;
  /// tdy-light
  final Color tdyLight;
  /// check-female
  final Color checkFemale;
  /// check-male
  final Color checkMale;
  /// ovulation-soft
  final Color ovulationSoft;
  /// ovulation-main
  final Color ovulationMain;
  /// ovulation-typo
  final Color ovulationTypo;
  /// period-soft
  final Color periodSoft;
  /// period-main
  final Color periodMain;
  /// period-typo
  final Color periodTypo;
  /// general-day
  final Color generalDay;
  /// tdy-stroke
  final Color tdyStroke;

  static const AppColorsSemanticCalendar lightTheme = AppColorsSemanticCalendar(
    tdy: Color(0xFF007AFF),
    tdyLight: Color(0x660070FF),
    checkFemale: Color(0xFFFF7E51),
    checkMale: Color(0xFF56D072),
    ovulationSoft: Color(0xFFB9F1ED),
    ovulationMain: Color(0xFF58D7CD),
    ovulationTypo: Color(0xFF28B8AC),
    periodSoft: Color(0xFFFFDAE4),
    periodMain: Color(0xFFFF99B6),
    periodTypo: Color(0xFFCE164A),
    generalDay: Color(0xFFEAEAEA),
    tdyStroke: Color(0x1A000000),
  );

  static const AppColorsSemanticCalendar darkTheme = AppColorsSemanticCalendar(
    tdy: Color(0xFF338CFF),
    tdyLight: Color(0x660070FF),
    checkFemale: Color(0xFFFF8C66),
    checkMale: Color(0xFF66D980),
    ovulationSoft: Color(0xFF264038),
    ovulationMain: Color(0xFF6BF2E6),
    ovulationTypo: Color(0xFF40CCBF),
    periodSoft: Color(0xFF401F26),
    periodMain: Color(0xFFFFA6BF),
    periodTypo: Color(0xFFFF5980),
    generalDay: Color(0xFF2C2C2C),
    tdyStroke: Color(0x4DFFFFFF),
  );
}

/// Semantic > Orb
@immutable
class AppColorsSemanticOrb {
  const AppColorsSemanticOrb({
    required this.priAccentOrg,
    required this.priAccent80,
    required this.priAccent60,
    required this.priAccent50,
    required this.secAccentOrg,
    required this.secAccent80,
    required this.secAccent60,
    required this.secAccent50,
  });

  /// pri-accent-org
  final Color priAccentOrg;
  /// pri-accent-80
  final Color priAccent80;
  /// pri-accent-60
  final Color priAccent60;
  /// pri-accent-50
  final Color priAccent50;
  /// sec-accent-org
  final Color secAccentOrg;
  /// sec-accent-80
  final Color secAccent80;
  /// sec-accent-60
  final Color secAccent60;
  /// sec-accent-50
  final Color secAccent50;

  static const AppColorsSemanticOrb lightTheme = AppColorsSemanticOrb(
    priAccentOrg: Color(0xE6FF6A33),
    priAccent80: Color(0xCCFF6A33),
    priAccent60: Color(0x99FF6A33),
    priAccent50: Color(0x80FF6A33),
    secAccentOrg: Color(0xE659F57B),
    secAccent80: Color(0xCC59F57B),
    secAccent60: Color(0x9959F57B),
    secAccent50: Color(0x8059F57B),
  );

  static const AppColorsSemanticOrb darkTheme = AppColorsSemanticOrb(
    priAccentOrg: Color(0xE6FF804D),
    priAccent80: Color(0xCCFF804D),
    priAccent60: Color(0x99FF804D),
    priAccent50: Color(0x80FF804D),
    secAccentOrg: Color(0xE666EB85),
    secAccent80: Color(0xCC66EB85),
    secAccent60: Color(0x9966EB85),
    secAccent50: Color(0x8066EB85),
  );
}

/// Palette
@immutable
class AppColorsPalette {
  const AppColorsPalette({
    required this.red,
    required this.amber,
    required this.coral,
    required this.skyblue,
    required this.blue,
    required this.green,
    required this.jade,
    required this.pink,
    required this.gray,
    required this.grayscale,
  });

  final AppColorsPaletteRed red;
  final AppColorsPaletteAmber amber;
  final AppColorsPaletteCoral coral;
  final AppColorsPaletteSkyblue skyblue;
  final AppColorsPaletteBlue blue;
  final AppColorsPaletteGreen green;
  final AppColorsPaletteJade jade;
  final AppColorsPalettePink pink;
  final AppColorsPaletteGray gray;
  final AppColorsPaletteGrayscale grayscale;

  static const AppColorsPalette lightTheme = AppColorsPalette(
    red: AppColorsPaletteRed.lightTheme,
    amber: AppColorsPaletteAmber.lightTheme,
    coral: AppColorsPaletteCoral.lightTheme,
    skyblue: AppColorsPaletteSkyblue.lightTheme,
    blue: AppColorsPaletteBlue.lightTheme,
    green: AppColorsPaletteGreen.lightTheme,
    jade: AppColorsPaletteJade.lightTheme,
    pink: AppColorsPalettePink.lightTheme,
    gray: AppColorsPaletteGray.lightTheme,
    grayscale: AppColorsPaletteGrayscale.lightTheme,
  );

  static const AppColorsPalette darkTheme = AppColorsPalette(
    red: AppColorsPaletteRed.darkTheme,
    amber: AppColorsPaletteAmber.darkTheme,
    coral: AppColorsPaletteCoral.darkTheme,
    skyblue: AppColorsPaletteSkyblue.darkTheme,
    blue: AppColorsPaletteBlue.darkTheme,
    green: AppColorsPaletteGreen.darkTheme,
    jade: AppColorsPaletteJade.darkTheme,
    pink: AppColorsPalettePink.darkTheme,
    gray: AppColorsPaletteGray.darkTheme,
    grayscale: AppColorsPaletteGrayscale.darkTheme,
  );
}

/// Palette > Red
@immutable
class AppColorsPaletteRed {
  const AppColorsPaletteRed({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteRed lightTheme = AppColorsPaletteRed(
    n10: Color(0xFFFFF2F2),
    n20: Color(0xFFFFE0E0),
    n30: Color(0xFFFFC7C7),
    n40: Color(0xFFFFA6A6),
    n50: Color(0xFFFF8080),
    n60: Color(0xFFF25959),
    n70: Color(0xFFD94040),
    n80: Color(0xFFB32E2E),
    n90: Color(0xFF8C1F1F),
    n100: Color(0xFF661414),
  );

  static const AppColorsPaletteRed darkTheme = AppColorsPaletteRed(
    n10: Color(0xFFFFF2F2),
    n20: Color(0xFFFFE0E0),
    n30: Color(0xFFFFC7C7),
    n40: Color(0xFFFFA6A6),
    n50: Color(0xFFFF8080),
    n60: Color(0xFFF25959),
    n70: Color(0xFFD94040),
    n80: Color(0xFFB32E2E),
    n90: Color(0xFF8C1F1F),
    n100: Color(0xFF661414),
  );
}

/// Palette > Amber
@immutable
class AppColorsPaletteAmber {
  const AppColorsPaletteAmber({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteAmber lightTheme = AppColorsPaletteAmber(
    n10: Color(0xFFFFF5E6),
    n20: Color(0xFFFFE6C2),
    n30: Color(0xFFFFD391),
    n40: Color(0xFFFEBE5E),
    n50: Color(0xFFFEAB2E),
    n60: Color(0xFFFE9800),
    n70: Color(0xFFD88100),
    n80: Color(0xFFB46C00),
    n90: Color(0xFF915700),
    n100: Color(0xFF724400),
  );

  static const AppColorsPaletteAmber darkTheme = AppColorsPaletteAmber(
    n10: Color(0xFFFFF5E6),
    n20: Color(0xFFFFE6C2),
    n30: Color(0xFFFFD391),
    n40: Color(0xFFFEBE5E),
    n50: Color(0xFFFEAB2E),
    n60: Color(0xFFFE9800),
    n70: Color(0xFFD88100),
    n80: Color(0xFFB46C00),
    n90: Color(0xFF915700),
    n100: Color(0xFF724400),
  );
}

/// Palette > Coral
@immutable
class AppColorsPaletteCoral {
  const AppColorsPaletteCoral({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteCoral lightTheme = AppColorsPaletteCoral(
    n10: Color(0xFFFFF0EB),
    n20: Color(0xFFFFD5C7),
    n30: Color(0xFFFFB79E),
    n40: Color(0xFFFF916B),
    n50: Color(0xFFFF6B38),
    n60: Color(0xFFFF490A),
    n70: Color(0xFFE03A00),
    n80: Color(0xFFBD3000),
    n90: Color(0xFF992700),
    n100: Color(0xFF7A1F00),
  );

  static const AppColorsPaletteCoral darkTheme = AppColorsPaletteCoral(
    n10: Color(0xFFFFF0EB),
    n20: Color(0xFFFFD5C7),
    n30: Color(0xFFFFB79E),
    n40: Color(0xFFFF916B),
    n50: Color(0xFFFF6B38),
    n60: Color(0xFFFF490A),
    n70: Color(0xFFE03A00),
    n80: Color(0xFFBD3000),
    n90: Color(0xFF992700),
    n100: Color(0xFF7A1F00),
  );
}

/// Palette > Skyblue
@immutable
class AppColorsPaletteSkyblue {
  const AppColorsPaletteSkyblue({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteSkyblue lightTheme = AppColorsPaletteSkyblue(
    n10: Color(0xFFF3FBFF),
    n20: Color(0xFFE3F5FF),
    n30: Color(0xFFCCEDFF),
    n40: Color(0xFFB5E4FF),
    n50: Color(0xFF9EDCFF),
    n60: Color(0xFF89D4FF),
    n70: Color(0xFF74B4D9),
    n80: Color(0xFF6197B5),
    n90: Color(0xFF4E7991),
    n100: Color(0xFF3E5F73),
  );

  static const AppColorsPaletteSkyblue darkTheme = AppColorsPaletteSkyblue(
    n10: Color(0xFFF3FBFF),
    n20: Color(0xFFE3F5FF),
    n30: Color(0xFFCCEDFF),
    n40: Color(0xFFB5E4FF),
    n50: Color(0xFF9EDCFF),
    n60: Color(0xFF89D4FF),
    n70: Color(0xFF74B4D9),
    n80: Color(0xFF6197B5),
    n90: Color(0xFF4E7991),
    n100: Color(0xFF3E5F73),
  );
}

/// Palette > Blue
@immutable
class AppColorsPaletteBlue {
  const AppColorsPaletteBlue({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteBlue lightTheme = AppColorsPaletteBlue(
    n10: Color(0xFFE6F6FF),
    n20: Color(0xFFC2E9FF),
    n30: Color(0xFF91D8FF),
    n40: Color(0xFF5EC6FF),
    n50: Color(0xFF2EB4FF),
    n60: Color(0xFF00A4FF),
    n70: Color(0xFF008BD9),
    n80: Color(0xFF0074B5),
    n90: Color(0xFF005D91),
    n100: Color(0xFF004A73),
  );

  static const AppColorsPaletteBlue darkTheme = AppColorsPaletteBlue(
    n10: Color(0xFFE6F6FF),
    n20: Color(0xFFC2E9FF),
    n30: Color(0xFF91D8FF),
    n40: Color(0xFF5EC6FF),
    n50: Color(0xFF2EB4FF),
    n60: Color(0xFF00A4FF),
    n70: Color(0xFF008BD9),
    n80: Color(0xFF0074B5),
    n90: Color(0xFF005D91),
    n100: Color(0xFF004A73),
  );
}

/// Palette > Green
@immutable
class AppColorsPaletteGreen {
  const AppColorsPaletteGreen({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteGreen lightTheme = AppColorsPaletteGreen(
    n10: Color(0xFFEFF9F1),
    n20: Color(0xFFD9F0DD),
    n30: Color(0xFFBBE3C2),
    n40: Color(0xFF9BD7A6),
    n50: Color(0xFF7DCB8B),
    n60: Color(0xFF61BF72),
    n70: Color(0xFF52A261),
    n80: Color(0xFF458851),
    n90: Color(0xFF376D41),
    n100: Color(0xFF2C5633),
  );

  static const AppColorsPaletteGreen darkTheme = AppColorsPaletteGreen(
    n10: Color(0xFFEFF9F1),
    n20: Color(0xFFD9F0DD),
    n30: Color(0xFFBBE3C2),
    n40: Color(0xFF9BD7A6),
    n50: Color(0xFF7DCB8B),
    n60: Color(0xFF61BF72),
    n70: Color(0xFF52A261),
    n80: Color(0xFF458851),
    n90: Color(0xFF376D41),
    n100: Color(0xFF2C5633),
  );
}

/// Palette > Jade
@immutable
class AppColorsPaletteJade {
  const AppColorsPaletteJade({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteJade lightTheme = AppColorsPaletteJade(
    n10: Color(0xFFF0FDFA),
    n20: Color(0xFFCDFAEF),
    n30: Color(0xFF9BF4E2),
    n40: Color(0xFF61E7D0),
    n50: Color(0xFF19BBA7),
    n60: Color(0xFF109183),
    n70: Color(0xFF12736B),
    n80: Color(0xFF135C56),
    n90: Color(0xFF144D48),
    n100: Color(0xFF052E2C),
  );

  static const AppColorsPaletteJade darkTheme = AppColorsPaletteJade(
    n10: Color(0xFFF0FDFA),
    n20: Color(0xFFCDFAEF),
    n30: Color(0xFF9BF4E2),
    n40: Color(0xFF61E7D0),
    n50: Color(0xFF19BBA7),
    n60: Color(0xFF109183),
    n70: Color(0xFF12736B),
    n80: Color(0xFF135C56),
    n90: Color(0xFF144D48),
    n100: Color(0xFF052E2C),
  );
}

/// Palette > Pink
@immutable
class AppColorsPalettePink {
  const AppColorsPalettePink({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPalettePink lightTheme = AppColorsPalettePink(
    n10: Color(0xFFFDEAF5),
    n20: Color(0xFFFACDE6),
    n30: Color(0xFFF6A6D2),
    n40: Color(0xFFF27CBD),
    n50: Color(0xFFEF54A9),
    n60: Color(0xFFEB2F96),
    n70: Color(0xFFC82880),
    n80: Color(0xFFA7216B),
    n90: Color(0xFF861B56),
    n100: Color(0xFF6A1544),
  );

  static const AppColorsPalettePink darkTheme = AppColorsPalettePink(
    n10: Color(0xFFFDEAF5),
    n20: Color(0xFFFACDE6),
    n30: Color(0xFFF6A6D2),
    n40: Color(0xFFF27CBD),
    n50: Color(0xFFEF54A9),
    n60: Color(0xFFEB2F96),
    n70: Color(0xFFC82880),
    n80: Color(0xFFA7216B),
    n90: Color(0xFF861B56),
    n100: Color(0xFF6A1544),
  );
}

/// Palette > Gray
@immutable
class AppColorsPaletteGray {
  const AppColorsPaletteGray({
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n100,
  });

  /// 10
  final Color n10;
  /// 20
  final Color n20;
  /// 30
  final Color n30;
  /// 40
  final Color n40;
  /// 50
  final Color n50;
  /// 60
  final Color n60;
  /// 70
  final Color n70;
  /// 80
  final Color n80;
  /// 90
  final Color n90;
  /// 100
  final Color n100;

  static const AppColorsPaletteGray lightTheme = AppColorsPaletteGray(
    n10: Color(0xFFEEEEEE),
    n20: Color(0xFFCACACA),
    n30: Color(0xFFB1B1B1),
    n40: Color(0xFF8D8D8D),
    n50: Color(0xFF777777),
    n60: Color(0xFF555555),
    n70: Color(0xFF4D4D4D),
    n80: Color(0xFF3C3C3C),
    n90: Color(0xFF2F2F2F),
    n100: Color(0xFF242424),
  );

  static const AppColorsPaletteGray darkTheme = AppColorsPaletteGray(
    n10: Color(0xFFEEEEEE),
    n20: Color(0xFFCACACA),
    n30: Color(0xFFB1B1B1),
    n40: Color(0xFF8D8D8D),
    n50: Color(0xFF777777),
    n60: Color(0xFF555555),
    n70: Color(0xFF4D4D4D),
    n80: Color(0xFF3C3C3C),
    n90: Color(0xFF2F2F2F),
    n100: Color(0xFF242424),
  );
}

/// Palette > Grayscale
@immutable
class AppColorsPaletteGrayscale {
  const AppColorsPaletteGrayscale({
    required this.n0,
    required this.n100,
  });

  /// 0
  final Color n0;
  /// 100
  final Color n100;

  static const AppColorsPaletteGrayscale lightTheme = AppColorsPaletteGrayscale(
    n0: Color(0xFFFFFFFF),
    n100: Color(0xFF000000),
  );

  static const AppColorsPaletteGrayscale darkTheme = AppColorsPaletteGrayscale(
    n0: Color(0xFFFFFFFF),
    n100: Color(0xFF000000),
  );
}

/// Sdk
@immutable
class AppColorsSdk {
  const AppColorsSdk({
    required this.mainBackground,
    required this.resultBackground,
    required this.primary500,
    required this.primary50080,
    required this.primary50024,
    required this.primary400,
    required this.primary40024,
    required this.primary4006,
    required this.primary300,
    required this.iconPrimary,
    required this.iconMuted,
    required this.iconOutline,
    required this.iconBackground,
    required this.iconInverse,
    required this.textButtonPrimary,
    required this.textButtonSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textInverse,
    required this.surfaceDefault,
    required this.surfaceDefault64,
    required this.surfaceDefault40,
    required this.surfaceDefault12,
    required this.surfaceInverse,
    required this.surfaceInverse80,
    required this.surfaceOutline,
    required this.surfaceOutline32,
    required this.surfaceNeutrality,
    required this.surfaceNeutrality36,
    required this.surfaceNeutrality24,
    required this.surfaceNeutrality12,
    required this.surfaceNeutrality6,
    required this.semanticPositive,
    required this.semanticPositive5,
    required this.semanticNegative,
    required this.semanticNegative80,
    required this.semanticNegative14,
    required this.semanticNegative5,
    required this.semanticNegative3,
    required this.semanticEmphasis,
    required this.semanticEmphasisBlur,
    required this.imageBackground15,
    required this.imageBackground2,
    required this.imageErrorBackground10,
    required this.imageErrorBackground3,
    required this.stautsBackground30,
    required this.stautsBackground5,
    required this.stautsErrorBackground30,
    required this.stautsErrorBackground5,
    required this.color,
    required this.color2,
  });

  /// main_background
  final Color mainBackground;
  /// result_background
  final Color resultBackground;
  /// primary_500
  final Color primary500;
  /// primary_500_80
  final Color primary50080;
  /// primary_500_24
  final Color primary50024;
  /// primary_400
  final Color primary400;
  /// primary_400_24
  final Color primary40024;
  /// primary_400_6
  final Color primary4006;
  /// primary_300
  final Color primary300;
  /// icon_primary
  final Color iconPrimary;
  /// icon_muted
  final Color iconMuted;
  /// icon_outline
  final Color iconOutline;
  /// icon_background
  final Color iconBackground;
  /// icon_inverse
  final Color iconInverse;
  /// text_button_primary
  final Color textButtonPrimary;
  /// text_button_secondary
  final Color textButtonSecondary;
  /// text_primary
  final Color textPrimary;
  /// text_secondary
  final Color textSecondary;
  /// text_tertiary
  final Color textTertiary;
  /// text_muted
  final Color textMuted;
  /// text_inverse
  final Color textInverse;
  /// surface_default
  final Color surfaceDefault;
  /// surface_default_64
  final Color surfaceDefault64;
  /// surface_default_40
  final Color surfaceDefault40;
  /// surface_default_12
  final Color surfaceDefault12;
  /// surface_inverse
  final Color surfaceInverse;
  /// surface_inverse_80
  final Color surfaceInverse80;
  /// surface_outline
  final Color surfaceOutline;
  /// surface_outline_32
  final Color surfaceOutline32;
  /// surface_neutrality
  final Color surfaceNeutrality;
  /// surface_neutrality_36
  final Color surfaceNeutrality36;
  /// surface_neutrality_24
  final Color surfaceNeutrality24;
  /// surface_neutrality_12
  final Color surfaceNeutrality12;
  /// surface_neutrality_6
  final Color surfaceNeutrality6;
  /// semantic_positive
  final Color semanticPositive;
  /// semantic_positive_5
  final Color semanticPositive5;
  /// semantic_negative
  final Color semanticNegative;
  /// semantic_negative_80
  final Color semanticNegative80;
  /// semantic_negative_14
  final Color semanticNegative14;
  /// semantic_negative_5
  final Color semanticNegative5;
  /// semantic_negative_3
  final Color semanticNegative3;
  /// semantic_emphasis
  final Color semanticEmphasis;
  /// semantic_emphasis_blur
  final Color semanticEmphasisBlur;
  /// image_background_15
  final Color imageBackground15;
  /// image_background_2
  final Color imageBackground2;
  /// image_error_background_10
  final Color imageErrorBackground10;
  /// image_error_background_3
  final Color imageErrorBackground3;
  /// stauts_background_30
  final Color stautsBackground30;
  /// stauts_background_5
  final Color stautsBackground5;
  /// stauts_error_background_30
  final Color stautsErrorBackground30;
  /// stauts_error_background_5
  final Color stautsErrorBackground5;
  /// Color
  final Color color;
  /// Color 2
  final Color color2;

  static const AppColorsSdk lightTheme = AppColorsSdk(
    mainBackground: Color(0xFFFFFFFF),
    resultBackground: Color(0xFFFAFAFA),
    primary500: Color(0xFF364152),
    primary50080: Color(0xCC364152),
    primary50024: Color(0x3D364152),
    primary400: Color(0xFF5A6B80),
    primary40024: Color(0x3D5A6B80),
    primary4006: Color(0x0F5A6B80),
    primary300: Color(0xFFB3C9F0),
    iconPrimary: Color(0xFF364152),
    iconMuted: Color(0xFFAAAAAA),
    iconOutline: Color(0xFFD1D6DB),
    iconBackground: Color(0xFFFAFAFA),
    iconInverse: Color(0xFFFFFFFF),
    textButtonPrimary: Color(0xFFFFFFFE),
    textButtonSecondary: Color(0xFF111111),
    textPrimary: Color(0xFF111111),
    textSecondary: Color(0xFF555555),
    textTertiary: Color(0xFF999999),
    textMuted: Color(0xFFBEBEBE),
    textInverse: Color(0xFFFFFFFF),
    surfaceDefault: Color(0xFFF1F3F5),
    surfaceDefault64: Color(0xA3F1F3F5),
    surfaceDefault40: Color(0x66F1F3F5),
    surfaceDefault12: Color(0x1FF1F3F5),
    surfaceInverse: Color(0xFFFFFFFF),
    surfaceInverse80: Color(0xCCFFFFFF),
    surfaceOutline: Color(0xFFE3E6EA),
    surfaceOutline32: Color(0x52E3E6EA),
    surfaceNeutrality: Color(0xFF607D8B),
    surfaceNeutrality36: Color(0x5C607D8B),
    surfaceNeutrality24: Color(0x3D607D8B),
    surfaceNeutrality12: Color(0x1F607D8B),
    surfaceNeutrality6: Color(0x0F607D8B),
    semanticPositive: Color(0xFF56C665),
    semanticPositive5: Color(0x0D56C665),
    semanticNegative: Color(0xFFFF4D4D),
    semanticNegative80: Color(0xCCFF4D4D),
    semanticNegative14: Color(0x24FF4D4D),
    semanticNegative5: Color(0x0DFF4D4D),
    semanticNegative3: Color(0x08FF4D4D),
    semanticEmphasis: Color(0xFF111111),
    semanticEmphasisBlur: Color(0xA6111111),
    imageBackground15: Color(0x26000000),
    imageBackground2: Color(0x05000000),
    imageErrorBackground10: Color(0x1AFF4D4D),
    imageErrorBackground3: Color(0x08FF4D4D),
    stautsBackground30: Color(0x4D56C665),
    stautsBackground5: Color(0x0D56C665),
    stautsErrorBackground30: Color(0x4DFF4D4D),
    stautsErrorBackground5: Color(0x0DFF4D4D),
    color: Color(0xFFFFF0EB),
    color2: Color(0xFFFFFFFF),
  );

  static const AppColorsSdk darkTheme = AppColorsSdk(
    mainBackground: Color(0xFF1B222C),
    resultBackground: Color(0xFF202833),
    primary500: Color(0xFF7095CF),
    primary50080: Color(0xCC7095CF),
    primary50024: Color(0x3D7095CF),
    primary400: Color(0xFF8AACE0),
    primary40024: Color(0x3D7095CF),
    primary4006: Color(0x0F7095CF),
    primary300: Color(0xFFB3C9F0),
    iconPrimary: Color(0xFFE6EDF3),
    iconMuted: Color(0xFFB6C3D2),
    iconOutline: Color(0xFF2F3A47),
    iconBackground: Color(0xFF222B36),
    iconInverse: Color(0xFFB6C3D2),
    textButtonPrimary: Color(0xFFFFFFFE),
    textButtonSecondary: Color(0xFFEBF5FF),
    textPrimary: Color(0xFFFFFFFE),
    textSecondary: Color(0xFFEBF5FF),
    textTertiary: Color(0xFFBECAD8),
    textMuted: Color(0xFF6F7B88),
    textInverse: Color(0xFF111111),
    surfaceDefault: Color(0xFF3C5064),
    surfaceDefault64: Color(0xA33C5064),
    surfaceDefault40: Color(0x663C5064),
    surfaceDefault12: Color(0x1F3C5064),
    surfaceInverse: Color(0xFF49566B),
    surfaceInverse80: Color(0xCC49566B),
    surfaceOutline: Color(0xFF2F3A47),
    surfaceOutline32: Color(0x522F3A47),
    surfaceNeutrality: Color(0xFFBDDAE9),
    surfaceNeutrality36: Color(0x5CBDDAE9),
    surfaceNeutrality24: Color(0x3DBDDAE9),
    surfaceNeutrality12: Color(0x1FBDDAE9),
    surfaceNeutrality6: Color(0x0FBDDAE9),
    semanticPositive: Color(0xFF56C665),
    semanticPositive5: Color(0x0D56C665),
    semanticNegative: Color(0xFFFF4D4D),
    semanticNegative80: Color(0xCCFF4D4D),
    semanticNegative14: Color(0x24FF4D4D),
    semanticNegative5: Color(0x0DFF4D4D),
    semanticNegative3: Color(0x08FF4D4D),
    semanticEmphasis: Color(0xFFFFFFFE),
    semanticEmphasisBlur: Color(0xA6FFFFFE),
    imageBackground15: Color(0x2649566B),
    imageBackground2: Color(0x0549566B),
    imageErrorBackground10: Color(0x1AFF4D4D),
    imageErrorBackground3: Color(0x08FF4D4D),
    stautsBackground30: Color(0x4D56C665),
    stautsBackground5: Color(0x0D56C665),
    stautsErrorBackground30: Color(0x4DFF4D4D),
    stautsErrorBackground5: Color(0x0DFF4D4D),
    color: Color(0xFFFFF0EB),
    color2: Color(0xFFFFFFFF),
  );
}

