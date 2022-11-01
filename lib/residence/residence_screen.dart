import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';

import 'residence_client_state_notifier.dart';
import 'model/residence_metadata.dart';
import 'components/residence_app_bar.dart';
import 'components/category_filtering_section.dart';
import 'components/category_content.dart';
import 'components/residence_floating_action_button.dart';
import 'components/residence_bottom_navigation_bar.dart';

class ResidenceScreen extends ConsumerWidget {
  const ResidenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(residenceClientStateNotifier);

    return Scaffold(
      backgroundColor: residenceMainBackgroundColor,
      appBar: const ResidenceAppBar(),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black87,
          ),
          child: ListView(
            children: [
              const CategoryFilteringSection(),
              for (ResidenceMetadata residenceMetadata
                  in state.residenceMetadataList) ...{
                CategoryContent(
                  name: residenceMetadata.name!,
                  // intlパッケージを使用して不動産価格に三桁ごとにカンマを入れる
                  price: '${NumberFormat("#,###").format(
                    residenceMetadata.price,
                  )}万円',
                  place: residenceMetadata.place!,
                  size: residenceMetadata.size!,
                  buildingInfo: residenceMetadata.buildingInfo!,
                  residenceInsideImagePath:
                      residenceMetadata.residenceInsideImagePath!,
                  residenceOutsideImagePath:
                      residenceMetadata.residenceOutsideImagePath!,
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
        ),
      ),
      floatingActionButton: const ResidenceFloatingActionButton(),
      bottomNavigationBar: const ResidenceBottomNavigationBar(),
    );
  }
}
