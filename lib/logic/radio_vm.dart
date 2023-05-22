import 'package:cindy_radio/data/repository/service/radio_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/radio_model.dart';

class RadioVm {
  final Ref ref;
  RadioVm(this.ref);



  Future<List<RadioModel>> fetchStations() async {
    final stations = await ref.read(radioServiceProvider).fetchStations();
    return stations;
  }
}


final radioStationsVm =
    FutureProvider.autoDispose((ref) => RadioVm(ref).fetchStations());


final currentIndexProvider = StateProvider<int>((ref) => 0);