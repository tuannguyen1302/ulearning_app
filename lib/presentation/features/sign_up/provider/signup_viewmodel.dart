import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utilities/popup_messages.dart';
import '../../../global_loader/global_loader.dart';
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

  Future<void> handleSignUp(BuildContext _context) async {
    final userName = state.userName;
    final email = state.email;
    final password = state.password;
    final rePassword = state.rePassword;

    // Regex kiểm tra định dạng email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Regex kiểm tra định dạng mật khẩu (ít nhất 8 ký tự, bao gồm chữ, số và ký tự đặc biệt)
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    // 1. Kiểm tra các trường không được để trống
    if (userName.isEmpty) {
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

    // 2. Kiểm tra định dạng email
    if (!emailRegex.hasMatch(email)) {
      await toastInfo('Email không hợp lệ');
      return;
    }

    // 3. Kiểm tra định dạng mật khẩu
    if (!passwordRegex.hasMatch(password)) {
      await toastInfo(
        'Mật khẩu không hợp lệ. Mật khẩu cần ít nhất 8 ký tự, bao gồm chữ, số và ký tự đặc biệt',
      );
      return;
    }

    // 4. Kiểm tra mật khẩu và xác nhận mật khẩu
    if (password != rePassword) {
      await toastInfo('Mật khẩu và xác nhận mật khẩu không trùng khớp');
      return;
    }
    ref.read(globalLoaderProvider.notifier).setLoaderValue(true);
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          if (credential.user != null) {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(userName);
            print('=============${credential.user}');
            await toastInfo('dang ki thanh cong ');
            Navigator.of(_context).pop();
          }
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
        }
        ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
      },
    );
  }
}
