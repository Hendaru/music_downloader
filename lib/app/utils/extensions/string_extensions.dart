import 'dart:math';

import 'package:music_download_youtube/app/utils/extensions/pattern.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';

extension StringExtension on String? {
  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  // remove symbol
  String removeSymbol({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!.replaceAll(RegExp(r'[^\w\s]+'), '');
    }
  }

  //add dust
  String get replacetoDash {
    if (this == null) {
      return "";
    }
    final pattern = RegExp('\\s+');
    return this!.replaceAll(pattern, "-");
  }

  //add rondom number
  String get addRondomNumber {
    if (this == null) {
      return "";
    }
    // ignore: non_constant_identifier_names
    int MAX = 1000;
    return "$this-${Random().nextInt(MAX)}";
  }

  /// Capitalize given String
  // ignore: prefer_is_empty
  String capitalizeFirstLetter() => (validate().length >= 1)
      ? (this!.substring(0, 1).toUpperCase() + this!.substring(1).toLowerCase())
      : validate();

  bool get isNumeric {
    // ignore: unnecessary_null_comparison
    if (this == null) {
      return false;
    }
    return double.tryParse(toString()) != null;
  }

  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Check Password validation
  bool validatePass() => hasMatch(this, Patterns.pass);

  /// Check Password validation
  bool validatePassV2() => hasMatch(this, Patterns.pass);

  /// Check uppercasePass validation
  bool uppercasePass() => hasMatch(this, Patterns.uppercasePass);

  /// Check lowercasePass validation
  bool lowercasePass() => hasMatch(this, Patterns.lowercasePass);

  /// Check oneDigitPass validation
  bool oneDigitPass() => hasMatch(this, Patterns.oneDigitPass);

  /// Check oneDigitPass validation
  bool specialCharacterPass() => hasMatch(this, Patterns.specialCharacterPass);

  //add rondom number
  // String get artistName {
  //   if (this == null) {
  //     return "";
  //   }
  //   var nameArtist = filterArtists(validate());

  //   return nameArtist;
  // }
}
