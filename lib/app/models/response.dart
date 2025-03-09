
import 'event/event.dart';
import 'organization/organization.dart';
import 'user/user.dart';

class ResponseModel {
  final String? message;
  final bool? isAdmin;
  final bool state;
  final String? authToken;
  final User? user;
  final Organization? organization;
  final Event? event;
  final List<User>? userList;
  final List<Event>? eventList;
  final List<Organization>? organizationList;
  final Map<String, dynamic>? users;
  final Map<String, dynamic>? events;
  final Map<String, dynamic>? organizations;
  final Map<String, dynamic>? userRole;

  ResponseModel({
    this.message,
    this.isAdmin = false,
    this.state = false,
    this.authToken,
    this.user,
    this.organization,
    this.event,
    this.userList,
    this.eventList,
    this.organizationList,
    this.users,
    this.events,
    this.organizations,
    this.userRole,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      state: json['state'] as bool,
      authToken: json['authToken'] as String?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      organization: json['organization'] != null ? Organization.fromJson(json['organization']) : null,
      event: json['event'] != null ? Event.fromJson(json['event']) : null,
      userList: (json['user_list'] as List<dynamic>?)?.map((e) => User.fromJson(e)).toList(),
      eventList: (json['event_list'] as List<dynamic>?)?.map((e) => Event.fromJson(e)).toList(),
      organizationList: (json['organization_list'] as List<dynamic>?)?.map((e) => Organization.fromJson(e)).toList(),
      users: json['users'] as Map<String, dynamic>?,
      events: json['events'] as Map<String, dynamic>?,
      organizations: json['organizations'] as Map<String, dynamic>?,
      userRole: json['userRole'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'isAdmin': isAdmin,
      'state': state,
      'authToken': authToken,
      'user': user?.toJson(),
      'organization': organization?.toJson(),
      'event': event?.toJson(),
      'user_list': userList?.map((e) => e.toJson()).toList(),
      'event_list': eventList?.map((e) => e.toJson()).toList(),
      'organization_list': organizationList?.map((e) => e.toJson()).toList(),
      'users': users,
      'events': events,
      'organizations': organizations,
      'userRole': userRole,
    };
  }
}
