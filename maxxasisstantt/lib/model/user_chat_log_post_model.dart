import 'package:json_annotation/json_annotation.dart';
part 'user_chat_log_post_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UserChatLogPostModel {
  int? id;
  int? hotelId;
  int? requestHeaderId;
  String? userType;
  int? userId;
  String? userName;
  String? avatarUrl;
  String? messageType;
  String? message;
  bool? read;
  String? readAt;
  String? createdAt;
  String? recordType;
  bool? autoTranslate;
  String? fromLang;
  String? toLang;

  UserChatLogPostModel({
    this.id,
    this.hotelId,
    this.requestHeaderId,
    this.userType,
    this.userId,
    this.userName,
    this.avatarUrl,
    this.messageType,
    this.message,
    this.read,
    this.readAt,
    this.createdAt,
    this.recordType,
    this.autoTranslate,
    this.fromLang,
    this.toLang,
  });

  factory UserChatLogPostModel.fromJson(Map<String, dynamic> json) =>
      _$UserChatLogPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserChatLogPostModelToJson(this);

  UserChatLogPostModel copyWith({
    int? id,
    int? hotelId,
    int? requestHeaderId,
    String? userType,
    int? userId,
    String? userName,
    String? avatarUrl,
    String? messageType,
    String? message,
    bool? read,
    String? readAt,
    String? createdAt,
    String? recordType,
    bool? autoTranslate,
    String? fromLang,
    String? toLang,
  }) {
    return UserChatLogPostModel(
      id: id ?? this.id,
      hotelId: hotelId ?? this.hotelId,
      requestHeaderId: requestHeaderId ?? this.requestHeaderId,
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
      read: read ?? this.read,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
      recordType: recordType ?? this.recordType,
      autoTranslate: autoTranslate ?? this.autoTranslate,
      fromLang: fromLang ?? this.fromLang,
      toLang: toLang ?? this.toLang,
    );
  }
}
//dart run build_runner watch