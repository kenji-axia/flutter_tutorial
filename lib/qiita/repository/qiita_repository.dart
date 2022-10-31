import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/qiita/api/qiita_api_client.dart';
import 'package:flutter_tutorial/qiita/model/qiita_item.dart';

final qiitaRepositoryProvider =
    Provider<QiitaRepository>((_) => QiitaRepository());

class QiitaRepository {
  QiitaApiClient _api = QiitaApiClient.create();

  Future<List<QiitaItem>> fetchQiitaItems(String tag) async {
    return _api.fetchQiitaItems(tag);
  }
}
