import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/utils/dio_provider.dart';
import 'package:flutter_tutorial/residence/api/residence_api_client.dart';
import 'package:flutter_tutorial/residence/model/residence_metadata.dart';

final residenceRepositoryProvider =
    Provider<ResidenceRepository>((ref) => ResidenceRepository(ref.read));

class ResidenceRepository {
  ResidenceRepository(this._read) {
    _api = ResidenceApiClient(_read(dioProvider));
  }

  final Reader _read;
  late final ResidenceApiClient _api;

  Future<List<ResidenceMetadata>> fetchResidenceMetadata() async {
    return _api.fetchResidenceMetadata();
  }
}
