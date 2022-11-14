import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_tutorial/drift/model/todo.dart';

part 'drift_client_state.freezed.dart';

@freezed
class DriftClientState with _$DriftClientState {
  const factory DriftClientState({
    @Default(<Todo>[]) List<Todo> todoList,
  }) = _TodoClientState;
}
