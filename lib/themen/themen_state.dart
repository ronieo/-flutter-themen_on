part of 'themen_cubit.dart';

enum AppThemen {
  light,
  dark,
}

class ThemenState extends Equatable {
  final AppThemen appThemen;
  ThemenState({
    this.appThemen = AppThemen.light,
  });

  factory ThemenState.initial() {
    return ThemenState();
  }

  @override
  List<Object> get props => [AppThemen];

  @override
  String toString() => 'ThemenState(appThemen: $appThemen)';

  ThemenState copyWith({
    AppThemen? appThemen,
  }) {
    return ThemenState(
      appThemen: appThemen ?? this.appThemen,
    );
  }

  //static ThemenState initial() {}
}
