import 'package:get/get.dart';
import 'package:music_download_youtube/app/core/utils/states.dart';

class InitialRx<Response> {
  Rx<States<Response>> create() {
    return Rx<States<Response>>(States.IDLE(null));
  }
}
