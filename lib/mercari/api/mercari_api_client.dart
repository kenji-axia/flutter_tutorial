import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

part 'mercari_api_client.g.dart';

@RestApi(baseUrl: 'https://tutorial6-4d9fc.web.app/api/v1/')
abstract class MercariApiClient {
  factory MercariApiClient(Dio dio, {String baseUrl}) = _MercariApiClient;

  @GET('mercari/index.json')
  Future<List<ItemMetadata>> fetchItemMetadata();
}
