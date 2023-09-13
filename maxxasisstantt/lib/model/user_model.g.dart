// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as int?,
      firstName: json['first_name'] as String?,
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicUrl: json['profile_pic_url'] as String?,
      locale: json['locale'] as String?,
      entryDate: json['entry_date'] as String?,
      releaseDate: json['release_date'] as String?,
      phoneNo: json['phone_no'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      eMail: json['e_mail'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      verify: json['verify'] as bool?,
      badge: json['badge'] as int?,
      lastBadgeTime: json['last_badge_time'] as String?,
      badgeA: json['badge_a'] as int?,
      lastBadgeATime: json['last_badge_a_time'] as String?,
      loyaltyCardId: json['loyalty_card_id'] as int?,
      loyaltyCardNo: json['loyalty_card_no'] as String?,
      loyaltyCardFamilyId: json['loyalty_card_family_id'] as int?,
      loyaltyCardFamilyName: json['loyalty_card_family_name'] as String?,
      specialLoyaltyMember: json['special_loyalty_member'] as bool?,
      blackList: json['black_list'] as bool?,
      blackListDate: json['black_list_date'] as String?,
      blackListComment: json['black_list_comment'] as String?,
      blackListApproved: json['black_list_approved'] as int?,
      blackListApprovedName: json['black_list_approved_name'] as String?,
      vipCode: json['vip_code'] as String?,
      vipDescription: json['vip_description'] as String?,
      vipListDate: json['vip_list_date'] as String?,
      vipListApproved: json['vip_list_approved'] as int?,
      vipListApprovedName: json['vip_list_approved_name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'first_name': instance.firstName,
      'name': instance.name,
      'last_name': instance.lastName,
      'profile_pic_url': instance.profilePicUrl,
      'locale': instance.locale,
      'entry_date': instance.entryDate,
      'release_date': instance.releaseDate,
      'phone_no': instance.phoneNo,
      'date_of_birth': instance.dateOfBirth,
      'e_mail': instance.eMail,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'verify': instance.verify,
      'badge': instance.badge,
      'last_badge_time': instance.lastBadgeTime,
      'badge_a': instance.badgeA,
      'last_badge_a_time': instance.lastBadgeATime,
      'loyalty_card_id': instance.loyaltyCardId,
      'loyalty_card_no': instance.loyaltyCardNo,
      'loyalty_card_family_id': instance.loyaltyCardFamilyId,
      'loyalty_card_family_name': instance.loyaltyCardFamilyName,
      'special_loyalty_member': instance.specialLoyaltyMember,
      'black_list': instance.blackList,
      'black_list_date': instance.blackListDate,
      'black_list_comment': instance.blackListComment,
      'black_list_approved': instance.blackListApproved,
      'black_list_approved_name': instance.blackListApprovedName,
      'vip_code': instance.vipCode,
      'vip_description': instance.vipDescription,
      'vip_list_date': instance.vipListDate,
      'vip_list_approved': instance.vipListApproved,
      'vip_list_approved_name': instance.vipListApprovedName,
    };
