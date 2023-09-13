enum UserType {
  user;

  String get getApiKey {
    switch (this) {
      case UserType.user:
        return "user";
    }
  }
}
