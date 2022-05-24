import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'themen_state.dart';

class ThemenCubit extends Cubit<ThemenState> {
  ThemenCubit() : super(ThemenState.initial());

  void changeThemen(int randInt) {
    if (randInt % 2 == 0) {
      emit(state.copyWith(appThemen: AppThemen.light));
    } else {
      emit(state.copyWith(appThemen: AppThemen.dark));
    }
  }
}
