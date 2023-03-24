import 'dart:convert';
import 'dart:developer';

import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/extensions/int_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/main.dart';

/// Add a value in SharedPref based on their type - Must be a String, int, bool, double, Map<String, dynamic> or StringList
Future<bool> setValue(String key, dynamic value, {bool print = true}) async {
  if (print) log('${value.runtimeType} - $key - $value');

  if (value is String) {
    return await sharedPreferences.setString(key, value.validate());
  } else if (value is int) {
    return await sharedPreferences.setInt(key, value.validate());
  } else if (value is bool) {
    return await sharedPreferences.setBool(key, value.validate());
  } else if (value is double) {
    return await sharedPreferences.setDouble(key, value.validate());
  } else if (value is Map<String, dynamic>) {
    return await sharedPreferences.setString(key, jsonEncode(value));
  } else if (value is List<String>) {
    return await sharedPreferences.setStringList(key, value);
  } else {
    throw ArgumentError(
        'Invalid value ${value.runtimeType} - Must be a String, int, bool, double, Map<String, dynamic> or StringList');
  }
}

/// Returns List of Keys that matches with given Key
List<String> getMatchingSharedPrefKeys(String key) {
  List<String> keys = [];

  sharedPreferences.getKeys().forEach((element) {
    if (element.contains(key)) {
      keys.add(element);
    }
  });

  return keys;
}

/// Returns a StringList if exists in SharedPref
removePref(String key) {
  return sharedPreferences.remove(key);
}

/// Returns a StringList if exists in SharedPref
removePrefAll() {
  return sharedPreferences.clear();
}

/// Returns a StringList if exists in SharedPref
List<String>? getStringListAsync(String key) {
  return sharedPreferences.getStringList(key);
}

/// Returns a Bool if exists in SharedPref
bool getBoolAsync(String key, {bool defaultValue = false}) {
  return sharedPreferences.getBool(key) ?? defaultValue;
}

/// Returns a Int if exists in SharedPref
int getIntAsync(String key, {int defaultValue = 0}) {
  return sharedPreferences.getInt(key) ?? defaultValue;
}

/// Returns a String if exists in SharedPref
String getStringAsync(String key, {String defaultValue = ''}) {
  return sharedPreferences.getString(key) ?? defaultValue;
}

T? getValue<T>(
  String key, [
  T Function(Map<String, dynamic>)? fromJson,
]) {
  switch (T) {
    case int:
      return sharedPreferences.getInt(key) as T?;
    case double:
      return sharedPreferences.getDouble(key) as T?;
    case String:
      return sharedPreferences.getString(key) as T?;
    case bool:
      return sharedPreferences.getBool(key) as T?;
    default:
      assert(fromJson != null, 'fromJson must be provided for Object values');
      if (fromJson != null) {
        final stringObject = sharedPreferences.getString(key);
        if (stringObject == null) return null;
        final jsonObject = jsonDecode(stringObject) as Map<String, dynamic>;
        return fromJson(jsonObject);
      }
  }
  return null;
}
