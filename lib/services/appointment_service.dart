import 'dart:convert';

import 'package:mohani/models/appointment_model.dart';
import 'package:http/http.dart' as http;

class AppointmetRequest {
  static const String baseUrl = 'http://mohani.com';
  static const String devUrl = 'http://localhost:13579';

  static Future<List<AppointmentModel>> getMonthAppointment(
      String groupId, String start, String end) async {
    List<AppointmentModel> appointmentList = [];
    final url = Uri.parse(
        '$devUrl/getAppointmentWithRange?groupId=$groupId&start=$start&end=$end');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> monthAppointment = jsonDecode(response.body);
      for (var day in monthAppointment) {
        appointmentList.add(AppointmentModel.fromJson(day));
      }
      return appointmentList;
    }
    throw Error();
  }

  static Future<List<AppointmentModel>> getDayAppointment(
      String groupId, DateTime selectedDay) async {
    List<AppointmentModel> appointmentList = [];
    String day = selectedDay.toString().substring(0, 10);
    final url = Uri.parse(
        '$devUrl/getAppointmentWithRange?groupId=$groupId&start=$day&end=$day');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> dayAppointment = jsonDecode(response.body);
      for (var day in dayAppointment) {
        appointmentList.add(AppointmentModel.fromJson(day));
      }
      return appointmentList;
    }
    throw Error();
  }
}
