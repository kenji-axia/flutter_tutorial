import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/mercari/api/mercari_api_client.dart';
import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

final mercariRepositoryProvider =
    Provider<MercariRepository>((_) => MercariRepository());

class MercariRepository {
  final MercariApiClient _api = MercariApiClient.create();

  Future<List<ItemMetadata>> fetchItemMetadata() async {
    return _api.fetchItemMetadata();
  }
}
