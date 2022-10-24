import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/mercari/mercari_client_state_notifier.dart';
import 'package:flutter_tutorial/mercari/model/item_metadata.dart';

import 'mercari_item.dart';

class MercariBodyBottom extends ConsumerWidget {
  MercariBodyBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mercariClientStateNotifier);

    return Padding(
      padding: const EdgeInsets.only(
        top: spacing2,
        left: spacing2,
      ),
      child: Column(
        children: [
          ItemListHeader(),
          sizedBoxH8,
          for (ItemMetadata itemMetadata in state.itemMetadataList) ...{
            MercariItem(
              name: itemMetadata.name!,
              // intlパッケージで商品価格に三桁ごとにカンマを入れる
              price: '¥${NumberFormat("#,###").format(
                itemMetadata.price!,
              )}',
              // intlパッケージで商品を探している人数に三桁ごとにカンマを入れる
              searchingNum: '${NumberFormat("#,###").format(
                itemMetadata.searchingNum!,
              )}人',
              imagePath: itemMetadata.imagePath!,
            )
          },
          Visibility(
            visible: state.isLoading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemListHeader extends StatelessWidget {
  const ItemListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '売れやすい持ち物',
                style: fontWeightBoldTextStyle,
              ),
              sizedBoxH2,
              Text(
                '使わないモノを出品してみよう！',
                style: TextStyle(
                  color: grey600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        // 「すべてを見る＞」　ボタンの作成
        GestureDetector(
          onTap: () {},
          child: Row(
            children: const [
              Text(
                'すべて見る',
                style: TextStyle(
                  fontSize: 13,
                  color: blueAccent,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: blueAccent,
              )
            ],
          ),
        ),
        sizedBoxW16,
      ],
    );
  }
}
