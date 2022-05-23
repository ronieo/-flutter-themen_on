import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'themen_state.dart';

class ThemenCubit extends Cubit<ThemenState> {
  ThemenCubit() : super(ThemenInitial());
}
