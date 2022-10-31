import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/youtube_repository.dart';
import 'state/youtube_client_state.dart';

final youtubeClientStateNotifier = StateNotifierProvider.autoDispose<
    YoutubeClientStateNotifier,
    YoutubeClientState>((ref) => YoutubeClientStateNotifier(ref.read));

class YoutubeClientStateNotifier extends StateNotifier<YoutubeClientState> {
  YoutubeClientStateNotifier(this._read) : super(const YoutubeClientState()) {
    fetchMovieMetadata();
  }

  final Reader _read;

  Future<void> fetchMovieMetadata() async {
    state = state.copyWith(isLoading: true);

    final movieMetadataList =
        await _read(youtubeRepositoryProvider).fetchMovieMetadata();

    if (movieMetadataList.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        movieMetadataList: movieMetadataList,
      );
    }
  }
}
