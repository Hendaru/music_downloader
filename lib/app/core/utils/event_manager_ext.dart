import 'package:music_download_youtube/app/core/utils/event_manager.dart';

extension EventManagerExtension on EventManager {
  void addEvent({required EventManager? event}) {
    if (event is InitializeEvent) {
      result.listen((p0) {
        event.result.value = p0;
      });
      call();
    }
  }
}
