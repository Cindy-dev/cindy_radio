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
    final isar = await openIsar();
    final favoriteDB = isar.favoriteDBs;
    // Check if the product already exists in the favorite list
    final existingItem =
        await favoriteDB.where().sortByStationuuid().findFirst();

    if (existingItem == null) {
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
    } else {
      print("object");
      // If the product already exists, do nothing
    }
  }

   Future<bool> existingItemFave(String stationuuid) async {
    final isar = await openIsar();
    final favoriteDB = isar.favoriteDBs;
    final existingItem =
        favoriteDB.where().filter().stationuuidContains(stationuuid);
    return existingItem.isEmptySync();
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
    final isar = await openIsar();
    final favoriteDB = isar.favoriteDBs;

    final existingItem =
        favoriteDB.where().filter().stationuuidContains(stationuuid);

    if (existingItem.isEmptySync()) {
      // Insert or update station
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
    } else {
      final isar = await openIsar();
      final itemIdToDelete = id!; // user-selected id
      await isar.writeTxn(() async {
        await isar.favoriteDBs.delete(itemIdToDelete);
      });
    }
  }
}

final favoriteRadioStationServiceProvider =
    Provider((ref) => FavoriteRadioService());
