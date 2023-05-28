import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(tagsProvider);
    return ListView.builder(
      shrinkWrap: true,
        itemCount: vm.length,
        itemBuilder: (context, i){
      return Text(vm[i], style: AppTextStyles.displayLarge);
    });
  }
}
