import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:flutter_tutorial/residence/api/residence_api_client.dart';
import 'package:flutter_tutorial/residence/model/residence_metadata.dart';

final residenceRepositoryProvider =
    Provider<ResidenceRepository>((_) => ResidenceRepository());

class ResidenceRepository {
  ResidenceRepository() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    _api = ResidenceApiClient(dio);
  }
  late final ResidenceApiClient _api;

  Future<List<ResidenceMetadata>> fetchResidenceMetadata() async {
    return _api.fetchResidenceMetadata();
  }
}
