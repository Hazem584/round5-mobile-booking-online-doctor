import 'package:hive/hive.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';

class FavoriteLocalDataSource{
  final Box _box;

  FavoriteLocalDataSource(this._box);

  void toggleFavorite(DoctorModel doctorModel){
    if(_box.containsKey(doctorModel.doctorProfileId)){
      _box.delete(doctorModel.doctorProfileId);
    }else{
      _box.put(doctorModel.doctorProfileId, doctorModel.toJson());
    }
  }

  List<DoctorModel> getFavorites(){
    final favList = _box.values
        .map((e) => DoctorModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
    return favList;
  }

  get favIds => _box.keys.toSet();
}