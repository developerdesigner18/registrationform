import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences _prefs;

  static Future<LocalStorage> init() async {
    LocalStorage._prefs = await SharedPreferences.getInstance();
    return LocalStorage();
  }

  String retrieve(LSKey key) {
    return LocalStorage._prefs.getString(key.toString());
  }

  bool retrieve_bool(LSKey key) {
    return LocalStorage._prefs.getBool(key.toString());
  }

  void save(LSKey key, String data) {
    LocalStorage._prefs.setString(key.toString(), data);
  }

  void save_bool(LSKey key, bool data) {
    LocalStorage._prefs.setBool(key.toString(), data);
  }

  void remove(LSKey key) {
    LocalStorage._prefs.remove(key.toString());
  }

  void clearAll({List<dynamic> exclude}) {
    if (exclude == null) {
      LocalStorage._prefs.clear();
      return;
    }

    var tempValues = <dynamic>[];

    //extract key value in excluded List
    for (final key in exclude) {
      tempValues.add(LocalStorage._prefs.getString(key.toString()));
    }
    //clear all
    LocalStorage._prefs.clear();

    //add back excludes items
    for (var x = 0; x < tempValues.length; x++) {
      LocalStorage._prefs.setString(exclude[x].toString(), tempValues[x]);
    }
  }
}

enum LSKey { NAME, USERNAME, EMAIL, PHONE, BDATE }
