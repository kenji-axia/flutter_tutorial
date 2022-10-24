import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

part 'youtube_client_state.freezed.dart';

@freezed
class YoutubeClientState with _$YoutubeClientState {
  const factory YoutubeClientState({
    @Default(false) bool isLoading,
    @Default(<MovieMetadata>[]) List<MovieMetadata> movieMetadataList,
  }) = _YoutubeClientState;
}
