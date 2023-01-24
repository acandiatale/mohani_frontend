import 'dart:ffi';

class AppointmentModel {
  final String groupId;
  final Long appointmentId;
  final String content;
  final DateTime pickedDateTime;
  final DateTime writedDateTime;

  AppointmentModel.fromJson(Map<String, dynamic> json)
      : groupId = json['groupId'],
        appointmentId = json['appointmentId'],
        content = json['content'],
        pickedDateTime = json['pickedDateTime'],
        writedDateTime = json['writedDateTime'];
}
