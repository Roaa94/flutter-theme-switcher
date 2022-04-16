class StorageKeys {
  static const String themeMode = 'theme_mode';

  static const String primaryColor = 'primary_color';
}

/// Service that handles local storage
abstract class StorageService {
  /// Initializes the service and must be called before [runApp]
  Future<void> init();

  /// Retrieves a value from storage
  dynamic get(String key);

  /// Changes a value in storage
  void set(String key, dynamic value);
}
