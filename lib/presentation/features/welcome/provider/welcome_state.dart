import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'welcome_state.g.dart';

@Riverpod()
class WelcomeState extends _$WelcomeState {
  @override
  int build() {
    return 0;
  }
  void changePage(int index) {
    state = index;
  }
}