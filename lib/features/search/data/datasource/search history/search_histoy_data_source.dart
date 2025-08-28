import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_booking_online_doctor/features/search/data/datasource/search%20history/search_histoy_data_source_impl.dart';

class SearchHistoryDataSourceImpl extends SearchHistoryDataSource{
  final Box<String> box;

  SearchHistoryDataSourceImpl({required this.box});

  @override
  Future<void> clearHistory() async{
    await box.clear();
  }

  @override
  Future<List<String>> getHistory() async {
    return box.values.toList();
  }

  @override
  Future<void> saveSearch(String query) async{
    if(query.trim().isEmpty) return;
    if(!box.values.contains(query)){
      await box.add(query);
    }
  }

  ValueListenable<Box<String>> listenable(){
    return box.listenable();
  }
  
}