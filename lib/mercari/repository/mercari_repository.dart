import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:flutter_tutorial/mercari/api/mercari_api_client.dart';
import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

final mercariRepositoryProvider =
    Provider<MercariRepository>((_) => MercariRepository());

class MercariRepository {
  MercariRepository() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    _api = MercariApiClient(dio);
  }

  late final MercariApiClient _api;

  Future<List<ItemMetadata>> fetchItemMetadata() async {
    return _api.fetchItemMetadata();
  }
}
