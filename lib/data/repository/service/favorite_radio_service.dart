import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/favorite_db.dart';
import 'isar_service.dart';

class FavoriteRadioService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }

  Future<void> createFavorite(
    FavoriteDB newStation,
  ) async {
    final isar = await openIsar();
    isar.writeTxnSync<int>(() => isar.favoriteDBs.putSync(newStation));
  }

  Future<bool> existingItemFave(String stationuuid) async {
    final isar = await openIsar();
    final favoriteDB = isar.favoriteDBs;
    final existingItem =
        favoriteDB.where().filter().stationuuidContains(stationuuid);
    return existingItem.isEmptySync();
  }

  Stream<List<FavoriteDB>> getAllFavorites() async* {
    final isar = await openIsar();
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
      createFavorite(favoriteStation);
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
