import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:flutter_tutorial/qiita/api/qiita_api_client.dart';
import 'package:flutter_tutorial/qiita/model/qiita_item.dart';

final qiitaRepositoryProvider =
    Provider<QiitaRepository>((_) => QiitaRepository());

class QiitaRepository {
  QiitaRepository() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    _api = QiitaApiClient(dio);
  }
  late final QiitaApiClient _api;

  Future<List<QiitaItem>> fetchQiitaItems(String tag) async {
    return _api.fetchQiitaItems(tag);
  }
}
