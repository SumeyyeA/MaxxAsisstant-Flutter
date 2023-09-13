import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxxasisstantt/model/user_model.dart';
import 'package:maxxasisstantt/service/service.dart';

//servisleri profile_screende çağırmak yerine model oluşturuyoruz
//ChangeNotifierProvider diğer sayfadaki değişiklikleri dinleyerek veri almamızı kesinleştiriyor
final profileProvider = ChangeNotifierProvider<ProfileViewModel>((ref) {
  return ProfileViewModel();
});

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = true;
  DataModel<UserModel>? userModel;

  void stateLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stateOk() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMeInfo() async {
    stateLoading();
    userModel = await getMe();
    stateOk();
  }
}
