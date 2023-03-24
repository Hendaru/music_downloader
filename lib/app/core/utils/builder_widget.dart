import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/states.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/widgets/error_page_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/loading_custom_widget.dart';

class BuilderWidget<Response> extends StatelessWidget {
  const BuilderWidget({
    Key? key,
    required this.event,
    this.onError,
    this.onLoading,
    required this.onSuccess,
    this.onIdle,
  }) : super(key: key);

  final Rx<States<Response>> event;
  final Widget? Function(int code, String message)? onError;
  final Widget? Function()? onLoading;
  final Widget Function(Response? response) onSuccess;
  final Widget? Function()? onIdle;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Widget widget = Container();
      switch (event.value.status) {
        case Status.SUCCESS:
          widget = onSuccess(event.value.data);
          break;
        case Status.LOADING:
          widget =
              onLoading != null ? onLoading!()! : const LoadingCustomWidget();
          break;
        case Status.ERROR:
          widget = onError != null
              ? onError!(event.value.code ?? 909, event.value.message) ??
                  onSuccess(null)
              : const ErrorPageWidget();
          break;
        case Status.IDLE:
          widget = onIdle != null ? onIdle!() ?? Container() : onSuccess(null);
          break;
        default:
      }
      return widget;
    });
  }
}
