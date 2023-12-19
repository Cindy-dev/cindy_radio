import 'package:cindy_radio/data/model/recently_played_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'isar_service.dart';

class RecentlyPlayedService {
  Future<Isar> openIsar() async {
    return IsarService.isarInstance!;
  }
  Future<void> createRecentlyPlayed(
    RecentlyPlayedDB newStation,
  ) async {
    final isar = await openIsar();
    // Insert or update tasks
    isar.writeTxnSync<int>(() => isar.recentlyPlayedDBs.putSync(newStation));
  }

  addRecentlyPlayed({
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
    final recentlyPlayedDB = isar.recentlyPlayedDBs;
    // Check if the product already exists in the recently played list
    final existingStation =
        recentlyPlayedDB.where().filter().stationuuidContains(stationuuid);

    if (existingStation.isEmptySync()) {
      // If the station doesn't exist, add it to the list
      final recentlyPlayedStation = RecentlyPlayedDB()
        ..stationuuid = stationuuid
        ..url = url
        ..name = name
        ..clickcount = clickcount
        ..country = country
        ..countrycode = countrycode
        ..favicon = favicon
        ..tags = tags;
      createRecentlyPlayed(recentlyPlayedStation);
    } else {
      // If the product already exists, do nothing
    }
  }

  Future<bool> existingRecentItem(String stationuuid) async {
    final isar = await openIsar();
    final recentlyPlayedDB = isar.recentlyPlayedDBs;
    final existingItem =
        recentlyPlayedDB.where().filter().stationuuidContains(stationuuid);
    return existingItem.isEmptySync();
  }

  Stream<List<RecentlyPlayedDB>> getAllRecentlyPlayed() async* {
    final isar = await openIsar();
    yield* isar.recentlyPlayedDBs.where().watch(fireImmediately: true);
  }

  Future<void> deleteRecentlyPlayedItem(int id) async {
    final isar = await openIsar();
    final itemIdToDelete = id; // user-selected id
    await isar.writeTxn(() async {
      await isar.recentlyPlayedDBs.delete(itemIdToDelete); // delete
    });
  }
}

final recentlyPlayedStationServiceProvider =
    Provider((ref) => RecentlyPlayedService());
