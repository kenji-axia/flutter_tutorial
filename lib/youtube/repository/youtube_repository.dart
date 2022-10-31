import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/youtube/api/youtube_api_client.dart';
import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

final youtubeRepositoryProvider =
    Provider<FirebaseRepository>((_) => FirebaseRepository());

class FirebaseRepository {
  final YoutubeApiClient _api = YoutubeApiClient.create();

  Future<List<MovieMetadata>> fetchMovieMetadata() async {
    return _api.fetchMovieMetadata();
  }
}
