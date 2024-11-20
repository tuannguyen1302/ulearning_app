import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';
part 'signup_state.g.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default('') String userName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String rePassword,
  }) = _SignUpState;

  factory SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);
}
