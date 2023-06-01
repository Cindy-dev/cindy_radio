import 'package:cindy_radio/data/repository/service/radio_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/radio_model.dart';

class Tag {
  final List<RadioModel> radioModels;
  final String tags;

  Tag(this.radioModels, this.tags);
}

class RadioVm {
  final Ref ref;
  RadioVm(this.ref);

  Future<List<RadioModel>> fetchStations() async {
    final stations = await ref.read(radioServiceProvider).fetchStations();
    return stations;
  }

  tagClickShowList(Tag tag) {
    return tag.radioModels
        .where((radioModel) => radioModel.tags!.contains(tag.tags))
        .toList();
  }

  clickCountList() async {
    final stations = await fetchStations();
    if (stations.isNotEmpty) {
      stations.sort((a, b) => b.clickcount!.compareTo(a.clickcount!));
    } else {}
    return stations;
  }
}

final radioStationsVm = FutureProvider((ref) => RadioVm(ref).fetchStations());

final tagsProvider = Provider<List<String>>((ref) {
  final radioModels = ref.watch(radioStationsVm).value ?? [];
  final extractTags = ref.read(radioServiceProvider).extractTags(radioModels);
  return extractTags;
});

final clickCountVm = FutureProvider((ref) => RadioVm(ref).clickCountList());

final tagClickShowListProvider =
    Provider.family((ref, Tag tag) => RadioVm(ref).tagClickShowList(tag));

final currentIndexProvider = StateProvider<int>((ref) => 0);
