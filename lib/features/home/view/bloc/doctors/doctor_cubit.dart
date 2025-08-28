import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/repo/doctor_repo.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.doctorRepo) : super(DoctorInitial());

  final DoctorRepo doctorRepo;

  Future<void> loadDoctors() async {
    emit(DoctorLoading());
    final doctors = await doctorRepo.getDoctors();
    doctors.fold(
      (failure) => emit(DoctorError(message: failure.message)),
      (doctorsEntity) => emit(DoctorSuccess(doctors: doctorsEntity)),
    );
  }
}
