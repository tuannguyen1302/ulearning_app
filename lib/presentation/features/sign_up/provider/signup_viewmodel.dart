import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utilities/popup_messages.dart';
import 'signup_state.dart';

part 'signup_viewmodel.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => const SignUpState();

  void onUsernameChanged(String username) {
    state = state.copyWith(userName: username);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onRePasswordChanged(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }

  Future<void> handleSignUp() async {
    final useName = state.userName;
    final email = state.email;
    final password = state.password;
    final rePassword = state.rePassword;

    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final regex1 = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    // Kiểm tra các trường không được để trống
    if (useName.isEmpty || state.userName.isEmpty) {
      await toastInfo('Tên người dùng không được để trống');
      return;
    }
    if (email.isEmpty) {
      await toastInfo('Email không được để trống');
      return;
    }
    if (password.isEmpty) {
      await toastInfo('Mật khẩu không được để trống');
      return;
    }

    if (rePassword.isEmpty) {
      await toastInfo('Xác nhận mật khẩu không được để trống');
      return;
    }

    // Kiểm tra định dạng email
    if (!regex.hasMatch(email)) {
      await toastInfo('Email không hợp lệ');
      return;
    }

    // Kiểm tra định dạng mật khẩu
    if (!regex1.hasMatch(password)) {
      await toastInfo('Mật khẩu không hợp lệ');
      return;
    }

    // Kiểm tra mật khẩu và xác nhận
    if (state.password != state.rePassword || password != rePassword) {
      await toastInfo('Mật khẩu không trùng khớp');
      return;
    }
  }
}
