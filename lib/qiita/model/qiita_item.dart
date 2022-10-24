import 'package:freezed_annotation/freezed_annotation.dart';

import 'qiita_user.dart';

part 'qiita_item.freezed.dart';
part 'qiita_item.g.dart';

@freezed
class QiitaItem with _$QiitaItem {
  const factory QiitaItem({
    String? title,
    String? url,
    QiitaUser? user,
  }) = _QiitaItem;

  factory QiitaItem.fromJson(Map<String, dynamic> json) =>
      _$QiitaItemFromJson(json);
}
