import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/residence_repository.dart';
import 'state/residence_client_state.dart';

final residenceClientStateNotifier = StateNotifierProvider.autoDispose<
    ResidenceClientStateNotifier,
    ResidenceClientState>((ref) => ResidenceClientStateNotifier(ref.read));

class ResidenceClientStateNotifier extends StateNotifier<ResidenceClientState> {
  ResidenceClientStateNotifier(this._read)
      : super(const ResidenceClientState()) {
    fetchResidenceMetadata();
  }

  final Reader _read;

  Future<void> fetchResidenceMetadata() async {
    state = state.copyWith(isLoading: true);

    final residenceMetadataList =
        await _read(residenceRepositoryProvider).fetchResidenceMetadata();

    if (residenceMetadataList.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        residenceMetadataList: residenceMetadataList,
      );
    }
  }
}
