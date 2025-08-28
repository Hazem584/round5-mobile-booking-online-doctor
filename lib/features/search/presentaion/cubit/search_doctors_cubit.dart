import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_booking_online_doctor/features/search/domain/repos/search_repo.dart';
import '../../../home/domain/entities/doctor_entity.dart';

part 'search_doctors_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  String _lastQuery = '';

  Future<void> search({required String query}) async{
    _lastQuery = query;
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    final doctors = await searchRepo.getSearchResult(query: query);
    if (_lastQuery != query) return;
    doctors.fold(
      (failure) => emit(SearchError(message: failure.message)),
      (doctorsEntity){
        emit(SearchSuccess(doctors: doctorsEntity));
      }
    );
  }

}
