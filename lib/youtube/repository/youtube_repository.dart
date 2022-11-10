import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/utils/dio_provider.dart';
import 'package:flutter_tutorial/youtube/api/youtube_api_client.dart';
import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

final youtubeRepositoryProvider =
    Provider<YoutubeRepository>((ref) => YoutubeRepository(ref.read));

class YoutubeRepository {
  YoutubeRepository(this._read) {
    _api = YoutubeApiClient(_read(dioProvider));
  }

  final Reader _read;
  late final YoutubeApiClient _api;

  Future<List<MovieMetadata>> fetchMovieMetadata() async {
    return _api.fetchMovieMetadata();
  }
}
