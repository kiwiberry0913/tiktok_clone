import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_config_repo.dart';

// <PlaybackConfigModel> tells Notifier to expose data used in <PlaybackConfigModel>
class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final VideoPlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    // when user calls setMuted
    _repository
        .setMuted(value); // puts the value sent by the user onto phone's disc
    state = PlaybackConfigModel(
      // create a completely new state
      muted: value, // set muted to the value that the user sent
      autoplay: state
          .autoplay, // and autoplay is set to the value that is currently in the state
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoPlay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

// When playback_config_vm is built (initialized for the first time),
// it will have this data (below) on its state

// returns initial data of the state
// we can access the state of the Notifier anywhere else (above) as well
  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

// NotifierProvider<the type we want to expose, the data that the provider is going to expose>
final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
