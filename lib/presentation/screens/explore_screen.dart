import 'package:cindy_radio/logic/radio_vm.dart';
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
          return GestureDetector(
              onTap: () =>
                  ref.read(tagClickShowListProvider(Tag(radioModels, tag))),
              child: Text(vm[i], style: AppTextStyles.displayLarge));
        });
  }
}
