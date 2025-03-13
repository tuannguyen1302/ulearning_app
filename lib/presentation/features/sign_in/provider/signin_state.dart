import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';
part 'signin_state.g.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({

    @Default('') String email,
    @Default('') String password,

  }) = _SignInState;

  factory SignInState.fromJson(Map<String, dynamic> json) =>
      _$SignInStateFromJson(json);
}
