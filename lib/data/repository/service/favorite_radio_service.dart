import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/favorite_db.dart';

class FavoriteRadioService {
  late Future<Isar> db;

  FavoriteRadioService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      //Passing my collection schema to a new Open Isar instance
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([FavoriteDBSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> createTask(
    FavoriteDB newStation,
  ) async {
    final isar = await db;
    // Insert or update tasks
    isar.writeTxnSync<int>(() => isar.favoriteDBs.putSync(newStation));
  }

  final List<RadioModel> faveStations = [];

  List<RadioModel> get faveModels => faveStations;

  addFavoriteItem({
    required String stationuuid,
    required String url,
    required String name,
    required int clickcount,
    required String country,
    required String countrycode,
    required String favicon,
    required String tags,
  }) async {
    // Check if the product already exists in the favorite list
    bool exists = faveStations.any((item) => item.stationuuid == stationuuid);

    if (!exists) {
      // If the station doesn't exist, add it to the list
      final favoriteStation = FavoriteDB()
        ..stationuuid = stationuuid
        ..url = url
        ..name = name
        ..clickcount = clickcount
        ..country = country
        ..countrycode = countrycode
        ..favicon = favicon
        ..tags = tags;
      createTask(favoriteStation);

      //faveStations.add(newStation);
    } else {
      // If the product already exists, do nothing
    }
  }

  Stream<List<FavoriteDB>> getAllFavorites() async* {
    final isar = await db;
    yield* isar.favoriteDBs.where().watch(fireImmediately: true);
  }

  toggleFavoriteItem(
      {required String stationuuid,
      required String url,
      required String name,
      required int clickcount,
      required String country,
      required String countrycode,
      required String favicon,
      required String tags,
      int? id}) async {
    bool exists = faveStations.any((item) => item.stationuuid == stationuuid);

    if (!exists) {
      // Insert or update station
      addFavoriteItem(
          stationuuid: stationuuid,
          url: url,
          name: name,
          clickcount: clickcount,
          country: country,
          countrycode: countrycode,
          favicon: favicon,
          tags: tags);
      //faveStations.add(newStation);
    } else {
      final isar = await openIsar();
      final itemIdToDelete = id!; // user-selected id
      await isar.writeTxn(() async {
        await isar.favoriteDBs.delete(itemIdToDelete);
        // faveStations
        //   .removeWhere((item) => item.stationuuid == newStation.stationuuid);
      });
    }
  }
}

final favoriteRadioStationServiceProvider =
    Provider((ref) => FavoriteRadioService());
