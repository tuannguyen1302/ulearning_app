import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utilities/popup_messages.dart';
import '../../../global_loader/global_loader.dart';
import '../../home/home_screen.dart';
import '../model/user.dart';
import 'sign_in_state.dart';

part 'sign_in_viewmodel.g.dart';

@riverpod
class SignInViewmodel extends _$SignInViewmodel {
  late BuildContext context;

  @override
  SignInState build(BuildContext context) {
    this.context = context; // Khởi tạo context
    return const SignInState(); // State mặc định
  }

  void onUserEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> handleSignIn() async {
    final email = state.email;
    final password = state.password;

    if (email.isEmpty) {
      await toastInfo('Email không được để trống');
      return;
    }
    if (password.isEmpty) {
      await toastInfo('Password không được để trống');
      return;
    }

    ref.read(globalLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (!credential.user!.emailVerified) {
        await toastInfo('Tài khoản chưa được kích hoạt. Vui lòng kiểm tra email.');
        ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
        return;
      }

      final user = credential.user;
      if (user != null) {
        UserLoginReq userModel = UserLoginReq(
          avatar: user.photoURL,
          name: user.displayName,
          email: user.email,
          openID: user.uid,
          type: 1,
        );
        asyncPostAllData(userModel);

        // Điều hướng sang HomeScreen
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        await toastInfo('Login error');
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            await toastInfo('Không tìm thấy tài khoản.');
            break;
          case 'wrong-password':
            await toastInfo('Mật khẩu không đúng.');
            break;
          case 'invalid-email':
            await toastInfo('Email không hợp lệ.');
            break;
          default:
            await toastInfo('Đăng nhập thất bại. Thử lại sau.');
        }
      } else {
        if (kDebugMode) {
          print('Unexpected error: $e');
        }
        await toastInfo('Đã xảy ra lỗi. Vui lòng thử lại.');
      }
    }
    ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(UserLoginReq userModel) async {
    // Hàm xử lý logic lưu trữ dữ liệu, nếu cần
  }
}
