import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [];

  void uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final newVideo = VideoModel(title: "${DateTime.now()}");
    _list = [
      ..._list,
      newVideo
    ]; //..._list takes everyone that was on the list before, newVideo adds a new video to that list
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    return _list;
  }
}

final timeLineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
