class ChatModel {
  int? id;
  int? hotelId;
  String? recordType;
  int? requestHeaderId;
  String? userType;
  int? userId;
  String? userName;
  String? roomNo;
  String? avatarUrl;
  String? messageType;
  String? message;
  bool? read;
  String? readAt;
  String? createdAt;

  ChatModel({
    this.id,
    this.hotelId,
    this.recordType,
    this.requestHeaderId,
    this.userType,
    this.userId,
    this.userName,
    this.roomNo,
    this.avatarUrl,
    this.messageType,
    this.message,
    this.read,
    this.readAt,
    this.createdAt,
  });

  ChatModel copyWith({
    int? id,
    int? hotelId,
    String? recordType,
    int? requestHeaderId,
    String? userType,
    int? userId,
    String? userName,
    String? roomNo,
    String? avatarUrl,
    String? messageType,
    String? message,
    bool? read,
    String? readAt,
    String? createdAt,
  }) {
    return ChatModel(
      id: id ?? this.id,
      hotelId: hotelId ?? this.hotelId,
      recordType: recordType ?? this.recordType,
      requestHeaderId: requestHeaderId ?? this.requestHeaderId,
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      roomNo: roomNo ?? this.roomNo,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
      read: read ?? this.read,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotel_id': hotelId,
      'record_type': recordType,
      'request_header_id': requestHeaderId,
      'user_type': userType,
      'user_id': userId,
      'user_name': userName,
      'room_no': roomNo,
      'avatar_url': avatarUrl,
      'message_type': messageType,
      'message': message,
      'read': read,
      'read_at': readAt,
      'created_at': createdAt,
    };
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as int?,
      recordType: json['record_type'] as String?,
      requestHeaderId: json['request_header_id'] as int?,
      userType: json['user_type'] as String?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      roomNo: json['room_no'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      read: json['read'] as bool?,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  @override
  String toString() =>
      "ChatModel(id: $id,hotelId: $hotelId,recordType: $recordType,requestHeaderId: $requestHeaderId,userType: $userType,userId: $userId,userName: $userName,roomNo: $roomNo,avatarUrl: $avatarUrl,messageType: $messageType,message: $message,read: $read,readAt: $readAt,createdAt: $createdAt)";

  @override
  int get hashCode => Object.hash(
      id,
      hotelId,
      recordType,
      requestHeaderId,
      userType,
      userId,
      userName,
      roomNo,
      avatarUrl,
      messageType,
      message,
      read,
      readAt,
      createdAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          hotelId == other.hotelId &&
          recordType == other.recordType &&
          requestHeaderId == other.requestHeaderId &&
          userType == other.userType &&
          userId == other.userId &&
          userName == other.userName &&
          roomNo == other.roomNo &&
          avatarUrl == other.avatarUrl &&
          messageType == other.messageType &&
          message == other.message &&
          read == other.read &&
          readAt == other.readAt &&
          createdAt == other.createdAt;
}
