import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_tutorial/youtube/model/movie_metadata.dart';

part 'youtube_api_client.g.dart';

@RestApi(baseUrl: "https://tutorial6-4d9fc.web.app/api/v1/")
abstract class YoutubeApiClient {
  factory YoutubeApiClient(Dio dio, {String baseUrl}) = _YoutubeApiClient;

  static YoutubeApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return YoutubeApiClient(dio);
  }

  @GET("youtube/index.json")
  Future<List<MovieMetadata>> fetchMovieMetadata();
}
