enum MessageType {
  message;

  String get getApiKey {
    switch (this) {
      case MessageType.message:
        return "Message";
    }
  }
}
