import 'package:cindy_radio/data/repository/service/radio_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/radio_model.dart';

class RadioVm {
  final Ref ref;
  RadioVm(this.ref);

  int currentIndex = 0;

  void navigateToNextItem() async {
    final items = await ref.read(radioServiceProvider).fetchStations();
    if (currentIndex < items.length - 1) {
      //reload
      currentIndex++;
    }
  }

  void navigateToPreviousItem() {
    if (currentIndex > 0) {
      //reload
      currentIndex--;
    }
  }

  Future<List<RadioModel>> fetchStations() async {
    final stations = await ref.read(radioServiceProvider).fetchStations();
    return stations;
  }
}

final radioStationsProvider = Provider((ref) => RadioVm(ref));
final radioStationsVm =
    FutureProvider.autoDispose((ref) => RadioVm(ref).fetchStations());
