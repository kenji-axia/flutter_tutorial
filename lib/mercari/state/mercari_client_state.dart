import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

part 'mercari_client_state.freezed.dart';

@freezed
class MercariClientState with _$MercariClientState {
  const factory MercariClientState({
    @Default(false) bool isLoading,
    @Default(<ItemMetadata>[]) List<ItemMetadata> itemMetadataList,
  }) = _MercariClientState;
}
