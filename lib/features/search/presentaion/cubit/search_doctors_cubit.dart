import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_booking_with_doctor/features/home/domain/entities/doctor_entity.dart';
import 'package:online_booking_with_doctor/features/home/domain/repo/doctor_repo.dart';

part 'search_doctors_state.dart';

class SearchDoctorsCubit extends Cubit<SearchDoctorsState> {
  SearchDoctorsCubit(this.doctorRepo) : super(SearchDoctorsInitial());

  final DoctorRepo doctorRepo;

  Future<void> searchDoctors(String query) async{
    emit(SearchDoctorsLoading());
    final doctors = await doctorRepo.getDoctors();
    if (query.trim().isEmpty) {
      emit(SearchDoctorsInitial());
    }else{
      doctors.fold(
        (failure) => emit(SearchDoctorsError(message: failure.message)),
        (doctorsEntity){
          final filter = doctorsEntity.where((doctor){
            final nameMatch = doctor.name.toLowerCase().contains(query.toLowerCase());
            final specialistMatch = doctor.specialist.toLowerCase().contains(query.toLowerCase());
            return nameMatch || specialistMatch;
          }).toList();
          emit(SearchDoctorsSuccess(doctors: filter));
        }
      );
    }
  }
}
