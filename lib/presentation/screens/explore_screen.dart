import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/presentation/screens/tags_sublist_screen.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(tagsProvider);
    final radioModels = ref.watch(radioStationsVm).value ?? [];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: vm.length,
        itemBuilder: (context, i) {
          final tag = vm[i];
          final stationsWithTag =
              ref.watch(tagClickShowListProvider(Tag(radioModels, tag)));
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => TagsSubListScreen(
                          station: stationsWithTag,
                          stationName: vm[i],
                        )));
              },
              child: Text(vm[i], style: AppTextStyles.displayLarge));
        });
  }
}
