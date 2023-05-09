import 'package:flutter/material.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:simple_animations/simple_animations.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({Key? key, this.height, this.width, this.radius})
      : super(key: key);

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<double>(
        duration: const Duration(seconds: 2),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, _) {
          return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey[300]!.withOpacity(1.0 - value),
                      Colors.grey[100]!.withOpacity(value),
                    ],
                  ),
                  borderRadius: radiusWidget(radius)));
        });
  }
}
