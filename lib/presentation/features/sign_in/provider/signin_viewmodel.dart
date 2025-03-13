import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utilities/popup_messages.dart';
import '../../../global_loader/global_loader.dart';
import '../../home/home_screen.dart';
import '../models/user.dart';
import 'signin_state.dart';
part 'signin_viewmodel.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  late BuildContext context;
  @override
  SignInState build() => const SignInState();

  // @override
  // SignInState build(BuildContext context) {
  //   this.context = context; // Khởi tạo context
  //   return const SignInState(); // State mặc định
  // }

  void onUserEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> handleSignIn(BuildContext context) async {
    final email = state.email;
    final password = state.password;
    bool isValidGmail(String email) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
      );
      return emailRegex.hasMatch(email);
    }

    if (email.isEmpty) {
      await toastInfo('Email khong duoc de trong');
      return;
    }
    if (!isValidGmail(email)) {
      await toastInfo('Email khong dung dinh dang');
      return;
    }
    if (password.isEmpty) {
      await toastInfo('Password khong duoc de trong');
      return;
    }
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (!passwordRegex.hasMatch(password)) {
      await toastInfo(
        'Mật khẩu không hợp lệ. Mật khẩu cần ít nhất 8 ký tự, bao gồm chữ, số và ký tự đặc biệt',
      );
      return;
    }

    ref.read(globalLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credentials.user == null) {
        await toastInfo('User not found ');
        return;
      }
      if (!credentials.user!.emailVerified) {
        await toastInfo('Tài khoản chưa được kích hoạt. Vui lòng kiểm tra email.');
        ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
        return;
      }

      final user = credentials.user;
      if (user != null) {
        final displayName = user.displayName;
        final email = user.email;
      final photoUrl = user.photoURL;
       final id = user.uid;

        final userEntity = UserEntity();
        userEntity.avatar = photoUrl;
        userEntity.name = displayName;
        userEntity.email = email;
        userEntity.openId = id;
        userEntity.type = 1;
        await asyncPostAllData(userEntity);

        await toastInfo('login successfully');
        //print('login successfully');

        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        //
        // await Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            } else {
        await toastInfo('login failed');
      }
    } on FirebaseAuthException catch (e) {

      String? message = "Lỗi đăng nhập";
      if (e.code == 'user-not-found') {
        message = "Tài khoản không tồn tại!";
        await toastInfo(message);
      } else if (e.code == 'wrong-password') {
        message = "Sai mật khẩu!";
        await toastInfo(message);
      } else if (e.code == 'invalid-credential') {
        message = "Email hoặc mật khẩu không hợp lệ!";
        await toastInfo(message);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
  }

  Future<void> asyncPostAllData(UserEntity userEntity) async {}
}
