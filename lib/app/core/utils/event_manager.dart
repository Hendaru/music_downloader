import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/initial_rx.dart';
import 'package:music_download_youtube/app/core/utils/states.dart';
import 'package:music_download_youtube/app/data/models/response/error/res_error.dart';

abstract class EventManager<ResultType> {
  void call();

  Rx<States<ResultType>> result = Rx<States<ResultType>>(States.IDLE(null));
}

class InitializeEvent<T> implements EventManager<T> {
  InitializeEvent() {
    result = InitialRx<T>().create();
  }

  @override
  late Rx<States<T>> result;

  @override
  void call() {
    log('init resource');
  }
}

class NetworkOnlyResource<ResultType, RequestType>
    implements EventManager<ResultType> {
  NetworkOnlyResource({
    required this.createCall,
    required this.handleCallResult,
  }) {
    result.value = States.IDLE(null);
  }

  Future<RequestType> Function() createCall;
  Future<ResultType>? Function(RequestType? item) handleCallResult;
  RequestType? processResponse(RequestType data) => data;

  @override
  Rx<States<ResultType>> result = Rx<States<ResultType>>(States.IDLE(null));

  @override
  void call() {
    result.value = States.LOADING(null);

    createCall.call().then((value) {
      if (value != null) {
        var temp = handleCallResult(processResponse(value));

        temp?.then((response) {
          result.value = States.SUCCESS(response);
        });
      } else {
        result.value = States.ERROR("Something is Wrong..");
      }
    }).catchError((e, trace) {
      var message = "Something is Wrong..";
      var code = 909;
      ResError responseError;

      if (kDebugMode) {
        print('${e.runtimeType}');
        print('$e');
        print('$trace');
      }

      try {
        code = e.response?.statusCode;

        // NOTE RELOGIN SESSION ENDED

        if (code == 401) {
          //----------------401----------------
        } else if (code > 500) {
          // NOTE HANDLE STATUS CODE > 500 (MAINTENANCE)
          // print("----------------500----------------");
          return;
        }
      } catch (e) {
        if (kDebugMode) print('CATCH $e');
      }

      try {
        if (e.response.data != null) {
          message = ResError.fromJson(e.response.data).message;
        }
      } catch (err) {
        if (kDebugMode) print('CATCH2 $err');

        try {
          if (e.response.data != null) {
            message = e.response.data;
          }
        } catch (e) {
          if (kDebugMode) print('CATCH3 $e');
        }
      }

      try {
        if (e.type == DioErrorType.connectTimeout) {
          message = 'Request time out';
        }
      } catch (e) {
        if (kDebugMode) print('CATCH3 $e');
      }

      if (message.isEmpty) message = "Something is Wrong..";

      result.value = States.ERROR(
        message,
        code: code,
      );
    });
  }
}

handleError(int? statusCode) {
  switch (statusCode) {
    case 400:
      print("---------------Errror 400-----------------");

      // toast(error["message"].toString(),
      //     bgColor: primaryColor, length: Toast.LENGTH_LONG);
      break;
    case 401:
      print("---------------Errror 401-----------------");
      // removePref(apiToken);
      // toast(error["message"].toString(),
      //     bgColor: primaryColor, length: Toast.LENGTH_LONG);
      break;
    case 404:
      print("---------------Errror 404-----------------");
      // toast(error["message"].toString(),
      //     bgColor: primaryColor, length: Toast.LENGTH_LONG);
      break;
    case 403:
      print("---------------Errror 403-----------------");

      // toast(error["message"].toString(),
      //     bgColor: primaryColor, length: Toast.LENGTH_LONG);
      break;
    case 500:
      print("---------------Errror 500-----------------");

      // removePref(apiToken);

      // Get.offAllNamed(Routes.MAINTENENCE);
      break;
    default:
      print("---------------Errror Hore-----------------");

      // removePref(apiToken);
      // toast("Oops something went wrong",
      //     bgColor: primaryColor, length: Toast.LENGTH_LONG);
      // const ErrorScreen().launch(getContext, isNewTask: true);
      // Get.offAllNamed(Routes.MAINTENENCE);
      break;
    // return 'Oops something went wrong';
  }
}
