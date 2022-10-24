import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/mercari_repository.dart';
import 'state/mercari_client_state.dart';

final mercariClientStateNotifier = StateNotifierProvider.autoDispose<
    MercariClientStateNotifier,
    MercariClientState>((ref) => MercariClientStateNotifier(ref.read));

class MercariClientStateNotifier extends StateNotifier<MercariClientState> {
  MercariClientStateNotifier(this._read) : super(const MercariClientState()) {
    fetchItemMetadata();
  }

  final Reader _read;

  Future<void> fetchItemMetadata() async {
    state = state.copyWith(isLoading: true);

    final itemMetadataList =
        await _read(mercariRepositoryProvider).fetchItemMetadata();

    if (itemMetadataList.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        itemMetadataList: itemMetadataList,
      );
    }
  }
}
