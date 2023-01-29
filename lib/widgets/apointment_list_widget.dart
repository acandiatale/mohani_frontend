import 'package:flutter/material.dart';
import 'package:mohani/models/appointment_model.dart';

class AppointmentListWidget extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentListWidget({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              Text(
                "${appointment.pickedDateTime.hour}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 50),
              Text(
                appointment.content,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
