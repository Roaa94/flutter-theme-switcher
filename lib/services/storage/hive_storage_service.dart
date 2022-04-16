import 'package:flutter_theme_switcher/services/storage/storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageService implements StorageService {
  late Box hiveBox;

  Future<void> openBox([String boxName = 'FLUTTER_THEME_SWITCHER']) async {
    hiveBox = await Hive.openBox(boxName);
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await openBox();
  }

  @override
  dynamic get(String key) {
    hiveBox.get(key);
  }

  @override
  void set(String key, dynamic value) {
    hiveBox.put(key, value);
  }
}