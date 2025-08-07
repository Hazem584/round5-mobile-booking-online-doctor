import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/entities/doctor_entity.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/repo/doctor_repo.dart';

part 'doctors_specialty_state.dart';

class DoctorsSpecialtyCubit extends Cubit<DoctorsSpecialtyState> {
  DoctorsSpecialtyCubit(this.doctorRepo) : super(DoctorsSpecialtyInitial());

  final DoctorRepo doctorRepo;

  void loadDoctorsBySpecialty(String query) async{
    emit(DoctorsSpecialtyLoading());
    final doctors = await doctorRepo.getDoctors();
      doctors.fold(
        (failure) => emit(DoctorsSpecialtyError(message: failure.message)),
        (doctorsEntity){
          final filter = doctorsEntity.where((doctor){
            final specialistMatch = doctor.specialist.toLowerCase() == query.toLowerCase();
            return specialistMatch;
          }).toList();
          emit(DoctorsSpecialtySuccess(doctors: filter));
        }
      );
  }
}
