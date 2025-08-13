import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/repo/specialties_repo.dart';

part 'specialties_state.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  SpecialtiesCubit(this.specialtiesRepo) : super(SpecialtiesInitial());

  final SpecialtiesRepo specialtiesRepo;

  Future<void> loadSpecialties() async {
    emit(SpecialtiesLoading());
    final specialties = await specialtiesRepo.getSpecialties();
    specialties.fold(
      (failure) => emit(SpecialtiesError(message: failure.message)),
      (specialtiesEntity) => emit(SpecialtiesSuccess(specialties: specialtiesEntity))
    );
  }
}
