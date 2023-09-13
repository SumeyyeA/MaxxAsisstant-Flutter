import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  int? id;
  int? hotelId;
  String? firstName;
  String? name;
  String? lastName;
  String? profilePicUrl;
  String? locale;
  String? entryDate;
  String? releaseDate;
  String? phoneNo;
  String? dateOfBirth;
  String? eMail;
  String? createdAt;
  String? updatedAt;
  bool? verify;
  int? badge;
  String? lastBadgeTime;
  int? badgeA;
  String? lastBadgeATime;
  int? loyaltyCardId;
  String? loyaltyCardNo;
  int? loyaltyCardFamilyId;
  String? loyaltyCardFamilyName;
  bool? specialLoyaltyMember;
  bool? blackList;
  String? blackListDate;
  String? blackListComment;
  int? blackListApproved;
  String? blackListApprovedName;
  String? vipCode;
  String? vipDescription;
  String? vipListDate;
  int? vipListApproved;
  String? vipListApprovedName;

  UserModel({
    this.id,
    this.hotelId,
    this.firstName,
    this.name,
    this.lastName,
    this.profilePicUrl,
    this.locale,
    this.entryDate,
    this.releaseDate,
    this.phoneNo,
    this.dateOfBirth,
    this.eMail,
    this.createdAt,
    this.updatedAt,
    this.verify,
    this.badge,
    this.lastBadgeTime,
    this.badgeA,
    this.lastBadgeATime,
    this.loyaltyCardId,
    this.loyaltyCardNo,
    this.loyaltyCardFamilyId,
    this.loyaltyCardFamilyName,
    this.specialLoyaltyMember,
    this.blackList,
    this.blackListDate,
    this.blackListComment,
    this.blackListApproved,
    this.blackListApprovedName,
    this.vipCode,
    this.vipDescription,
    this.vipListDate,
    this.vipListApproved,
    this.vipListApprovedName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
