import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_tutorial/residence/model/residence_metadata.dart';

part 'residence_api_client.g.dart';

@RestApi(baseUrl: 'https://tutorial6-4d9fc.web.app/api/v1/')
abstract class ResidenceApiClient {
  factory ResidenceApiClient(Dio dio, {String baseUrl}) = _ResidenceApiClient;

  @GET('residence/index.json')
  Future<List<ResidenceMetadata>> fetchResidenceMetadata();
}
