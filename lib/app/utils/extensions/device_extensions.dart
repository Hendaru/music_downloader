import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';

enum DeviceSize { mobile, tablet, desktop }

extension LayoutUtils on BoxConstraints {
  /// returns DeviceSize
  DeviceSize get device {
    if (maxWidth >= desktopBreakpointGlobal) {
      return DeviceSize.desktop;
    }
    if (maxWidth >= tabletBreakpointGlobal) {
      return DeviceSize.tablet;
    }
    return DeviceSize.mobile;
  }
}

bool get isWeb => kIsWeb;

bool get isMobile => !isWeb && (Platform.isIOS || Platform.isAndroid);

bool get isAndroid => !isWeb && Platform.isAndroid;

bool get isIos => !isWeb && Platform.isIOS;
