import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:flutter_tutorial/youtube/api/youtube_api_client.dart';
import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

final youtubeRepositoryProvider =
    Provider<FirebaseRepository>((_) => FirebaseRepository());

class FirebaseRepository {
  FirebaseRepository() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    _api = YoutubeApiClient(dio);
  }
  late final YoutubeApiClient _api;

  Future<List<MovieMetadata>> fetchMovieMetadata() async {
    return _api.fetchMovieMetadata();
  }
}
