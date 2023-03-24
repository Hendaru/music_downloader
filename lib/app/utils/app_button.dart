import 'package:flutter/material.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/loading_custom_widget.dart';
import 'package:sizer/sizer.dart';

/// Default App Button
class AppButtonWidget extends StatefulWidget {
  final Function? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? loadingColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final bool? enabled;
  final bool? loading;
  final bool? enableScaleAnimation;

  const AppButtonWidget(
      {super.key,
      this.onTap,
      this.text,
      this.width,
      this.color,
      this.textColor,
      this.padding,
      this.margin,
      this.textStyle,
      this.shapeBorder,
      this.child,
      this.elevation,
      this.enabled,
      this.height,
      this.disabledColor,
      this.focusColor,
      this.hoverColor,
      this.splashColor,
      this.loadingColor,
      this.enableScaleAnimation,
      this.loading});

  @override
  // ignore: library_private_types_in_public_api
  _AppButtonWidgetState createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal ?? 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: MaterialButton(
        minWidth: widget.width,
        padding: widget.padding ?? dynamicAppButtonPadding(context),
        onPressed: widget.loading.validate()
            ? null
            : widget.enabled.validate(value: true)
                ? widget.onTap as void Function()?
                : null,
        color: widget.color ?? appButtonBackgroundColorGlobal,
        shape: widget.shapeBorder ?? defaultAppButtonShapeBorder,
        elevation: widget.elevation ?? defaultAppButtonElevation,
        animationDuration: const Duration(milliseconds: 100),
        height: widget.height,
        disabledColor: widget.disabledColor ?? greyColor,
        focusColor: widget.focusColor ?? whiteColor,
        hoverColor: widget.hoverColor ?? whiteColor,
        splashColor: widget.splashColor ?? Colors.transparent,
        child: widget.loading.validate()
            ? LoadingCustomWidget(
                color: widget.loadingColor ?? whiteColor,
                width: 2.h,
                height: 2.h,
              )
            : widget.child ??
                Text(
                  widget.text.validate(),
                  style: widget.textStyle ??
                      boldTextStyle(
                        color:
                            widget.textColor ?? defaultAppButtonTextColorGlobal,
                      ),
                ),
      ),
    );
  }
}
