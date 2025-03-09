import 'package:json_annotation/json_annotation.dart';

import '../organization/organization.dart';

//TODO: add roles

class User {
  User({
    this.id,
    this.profileImage,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.gender,
    this.organization,
    this.isVerified,
    this.blockStatus,
    this.registeredEvents,
    this.favourites,
    this.isAdmin = false,
this.userRole,
  });

  @JsonKey(name: '_id')
  final String? id;

  final String? profileImage;

  final String? name;

  final String? email;

  final String? password;

  @JsonKey(name: 'organization')
  final String? organization;

  final String? phone;

  final String? address;

  final String? gender;

  @JsonKey(name: 'hasVerifiedEmail')
  final bool? isVerified;

  final bool? isAdmin;

  // final Organization? organization;

  final List<String>? registeredEvents;

  final List<String>? favourites;

  final BlockStatus? blockStatus;

  final Map<String, dynamic>? userRole;
  

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      profileImage: json['profileImage'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      organization: json['organization'] as String?,
      isVerified: json['hasVerifiedEmail'] as bool?,
      registeredEvents: (json['registeredEvents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      favourites: (json['favourites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      blockStatus: json['blockStatus'] == null
          ? null
          : BlockStatus.fromJson(json['blockStatus'] as Map<String, dynamic>),

      userRole: json['userRole'] as Map<String, dynamic>?,
      isAdmin: json['userRole'] == null
          ? false
          : json['userRole']['admin'] as bool?,

    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null && id!.isNotEmpty) data['_id'] = id;
    if (profileImage != null && profileImage!.isNotEmpty) data['profileImage'] = profileImage;
    if (name != null && name!.isNotEmpty) data['name'] = name;
    if (email != null && email!.isNotEmpty) data['email'] = email;
    if (password != null && password!.isNotEmpty) data['password'] = password;
    if (phone != null && phone!.isNotEmpty) data['phone'] = phone;
    if (address != null && address!.isNotEmpty) data['address'] = address;
    if (gender != null && gender!.isNotEmpty) data['gender'] = gender;
    if (organization != null && organization!.isNotEmpty) data['organization'] = organization;
    if (isVerified != null) data['hasVerifiedEmail'] = isVerified;
    if (isAdmin != null) data['isAdmin'] = isAdmin;
    if (registeredEvents != null && registeredEvents!.isNotEmpty) data['registeredEvents'] = registeredEvents;
    if (favourites != null && favourites!.isNotEmpty) data['favourites'] = favourites;
    if (blockStatus != null) data['blockStatus'] = blockStatus!.toJson();
    if (userRole != null) data['userRole'] = userRole;
    return data;
  }
}
