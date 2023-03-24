import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';

class LoadingCustomWidget extends StatelessWidget {
  const LoadingCustomWidget({Key? key, this.width, this.height, this.color})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor),
          backgroundColor: Platform.isAndroid ? Colors.transparent : null,
        ),
      ),
    );
  }
}
