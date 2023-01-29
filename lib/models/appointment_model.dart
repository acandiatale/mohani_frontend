class AppointmentModel {
  final String groupId;
  final int appointmentId;
  final String content;
  final DateTime pickedDateTime;
  final DateTime writedDateTime;

  AppointmentModel.fromJson(Map<String, dynamic> json)
      : groupId = json['groupId'],
        appointmentId = json['appointmentId'],
        content = json['content'],
        pickedDateTime = DateTime.parse(json['pickedDateTime']),
        writedDateTime = DateTime.parse(json['writedTime']);
}
