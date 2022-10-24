import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_tutorial/residence/model/residence_metadata.dart';

part 'residence_client_state.freezed.dart';

@freezed
class ResidenceClientState with _$ResidenceClientState {
  const factory ResidenceClientState({
    @Default(false) bool isLoading,
    @Default(<ResidenceMetadata>[])
        List<ResidenceMetadata> residenceMetadataList,
  }) = _ResidenceClientState;
}
