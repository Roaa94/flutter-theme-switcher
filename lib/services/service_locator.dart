import 'package:flutter_theme_switcher/services/storage/hive_storage_service.dart';
import 'package:flutter_theme_switcher/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void setUpServiceLocator() {
  getIt.registerSingleton<StorageService>(HiveStorageService());
}
