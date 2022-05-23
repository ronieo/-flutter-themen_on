part of 'themen_cubit.dart';

enum AppThemen {
  light,
  dark,
}

class ThemenState {
  final AppThemen appThemen;

  ThemenState({
    this.appThemen = AppThemen.light,
  });

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
}
