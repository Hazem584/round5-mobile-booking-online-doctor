import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class SearchHistoryDataSource{
  Future<void> saveSearch(String query);
  Future<List<String>> getHistory();
  Future<void> clearHistory();
  ValueListenable<Box<String>> listenable();
}