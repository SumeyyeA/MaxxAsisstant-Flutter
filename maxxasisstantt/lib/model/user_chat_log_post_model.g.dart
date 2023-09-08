// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_log_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChatLogPostModel _$UserChatLogPostModelFromJson(
        Map<String, dynamic> json) =>
    UserChatLogPostModel(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as int?,
      requestHeaderId: json['request_header_id'] as int?,
      userType: json['user_type'] as String?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      read: json['read'] as bool?,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
      recordType: json['record_type'] as String?,
      autoTranslate: json['auto_translate'] as bool?,
      fromLang: json['from_lang'] as String?,
      toLang: json['to_lang'] as String?,
    );

Map<String, dynamic> _$UserChatLogPostModelToJson(
    UserChatLogPostModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('hotel_id', instance.hotelId);
  writeNotNull('request_header_id', instance.requestHeaderId);
  writeNotNull('user_type', instance.userType);
  writeNotNull('user_id', instance.userId);
  writeNotNull('user_name', instance.userName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('message_type', instance.messageType);
  writeNotNull('message', instance.message);
  writeNotNull('read', instance.read);
  writeNotNull('read_at', instance.readAt);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('record_type', instance.recordType);
  writeNotNull('auto_translate', instance.autoTranslate);
  writeNotNull('from_lang', instance.fromLang);
  writeNotNull('to_lang', instance.toLang);
  return val;
}
