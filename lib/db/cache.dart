//缓存管理类，单例模式
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  late SharedPreferences prefs;

  Cache._pre(this.prefs);

  static Cache? _instance;

  // 预初始化，防止在使用的时候，prefs还没完成初始化
  static Future<Cache?> preInit() async {
    if (_instance == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = Cache._pre(prefs);
    }
    return _instance;
  }

  static Cache? getInstance() {
    return _instance;
  }

  setString(String key, String value) {
    prefs.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs.setStringList(key, value);
  }

  T? get<T>(String key) {
    var result = prefs.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
