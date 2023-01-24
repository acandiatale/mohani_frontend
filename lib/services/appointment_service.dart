import 'package:mohani/models/appointment_model.dart';
import 'package:http/http.dart' as http;

class AppointmetRequest {
  static const String baseUrl = 'http://mohani.com';

  static Future<List<AppointmentModel>> getMonthAppointment(
      String groupId, String start, String end) async {
    List<AppointmentModel> appointmentList = [];
    final url = Uri.parse(
        '$baseUrl/getMonthAppointment?groupId=$groupId&start=$start&end=$end');
    final response = await http.get(url);
    return appointmentList;
  }
}
