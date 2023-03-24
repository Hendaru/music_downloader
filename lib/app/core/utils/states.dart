import 'package:music_download_youtube/app/utils/enums.dart';

class States<T> {
  States({
    this.status,
    this.data,
    this.message = '',
    this.code,
  });

  final Status? status;
  final T? data;
  final String message;
  final int? code;

  // ignore: non_constant_identifier_names
  static States<T> LOADING<T>(T? data) {
    return States(status: Status.LOADING, data: null);
  }

  // ignore: non_constant_identifier_names
  static States<T> SUCCESS<T>(T? data) {
    return States(status: Status.SUCCESS, data: data);
  }

  // ignore: non_constant_identifier_names
  static States<T> ERROR<T>(String message, {int? code}) {
    return States(status: Status.ERROR, message: message, code: code);
  }

  // ignore: non_constant_identifier_names
  static States<T> IDLE<T>(T? data) {
    return States(status: Status.IDLE, data: data);
  }

  @override
  String toString() {
    return 'Resource(status: $status, data: $data, message: $message, code: $code)';
  }
}
