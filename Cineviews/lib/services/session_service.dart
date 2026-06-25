import 'package:get/get.dart';

import '../models/user.dart';

class SessionService extends GetxService {
  static SessionService get to => Get.find();

  final Rxn<User> currentUser = Rxn<User>();

  bool get isLoggedIn => currentUser.value != null;

  void setCurrentUser(User user) {
    currentUser.value = user;
  }

  void clearSession() {
    currentUser.value = null;
  }

  void updateCurrentUser({
    required String firstName,
    required String lastName,
    required String email,
    String? bio,
  }) {
    final User? user = currentUser.value;
    if (user == null) return;

    currentUser.value = User(
      id: user.id,
      username: user.username,
      password: user.password,
      firstName: firstName,
      lastName: lastName,
      email: email,
      resetKey: user.resetKey,
      status: user.status,
      activationKey: user.activationKey,
      birthDate: user.birthDate,
      profilePicture: user.profilePicture,
      sex: user.sex,
      nationality: user.nationality,
      bio: bio ?? user.bio,
    );
  }
}
