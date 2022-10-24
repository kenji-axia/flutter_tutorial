import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/residence/api/residence_api_client.dart';
import 'package:flutter_tutorial/residence/model/residence_metadata.dart';

final residenceRepositoryProvider =
    Provider<ResidenceRepository>((_) => ResidenceRepository());

class ResidenceRepository {
  final ResidenceApiClient _api = ResidenceApiClient.create();

  Future<List<ResidenceMetadata>> fetchResidenceMetadata() async {
    return _api.fetchResidenceMetadata();
  }
}
