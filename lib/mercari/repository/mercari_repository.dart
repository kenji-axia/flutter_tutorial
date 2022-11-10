import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/utils/dio_provider.dart';
import 'package:flutter_tutorial/mercari/api/mercari_api_client.dart';
import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

final mercariRepositoryProvider =
    Provider<MercariRepository>((ref) => MercariRepository(ref.read));

class MercariRepository {
  MercariRepository(this._read) {
    _api = MercariApiClient(_read(dioProvider));
  }

  final Reader _read;
  late final MercariApiClient _api;

  Future<List<ItemMetadata>> fetchItemMetadata() async {
    return _api.fetchItemMetadata();
  }
}
