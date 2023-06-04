import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteRadioService {
  final List<RadioModel> faveStations = [];
  List<RadioModel> get faveModels => faveStations;

  void addFavoriteItem(RadioModel radioModel) {
    // Check if the product already exists in the favorite list
    bool exists =
        faveStations.any((item) => item.stationuuid == radioModel.stationuuid);

    if (!exists) {
      // If the product doesn't exist, add it to the list
      faveStations.add(radioModel);
    } else {
      // If the product already exists, do nothing
    }
  }

  toggleFavoriteItem(RadioModel radioModel) {
    bool exists =
        faveStations.any((item) => item.stationuuid == radioModel.stationuuid);

    if (!exists) {
      faveStations.add(radioModel);
    } else {
      faveStations
          .removeWhere((item) => item.stationuuid == radioModel.stationuuid);
    }
  }
}

final favoriteRadioStationServiceProvider =
    Provider((ref) => FavoriteRadioService());
