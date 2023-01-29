import 'package:flutter/material.dart';
import 'package:mohani/models/appointment_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../screens/add_appointment_screen.dart';
import '../services/appointment_service.dart';
import '../utils/calendar_util.dart';
import 'apointment_list_widget.dart';

class CalendarWidget extends StatefulWidget {
  final String language;

  const CalendarWidget({
    super.key,
    required this.language,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidget();
}

class _CalendarWidget extends State<CalendarWidget> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late String language;
  List<AppointmentModel> monthAppointmentList = [];
  List<AppointmentModel> selectedDayList = [];

  Future getMonthAppointment() async {
    DateTime now = DateTime.now();
    String month = now.month < 10 ? "0${now.month}" : "${now.month}";
    monthAppointmentList = await AppointmetRequest.getMonthAppointment(
        "jawsubak,sinhee0424",
        "${now.year}-$month-01",
        "${now.year}-$month-${getMonthRange(now)}");
    setState(() {
      monthAppointmentList;
    });
  }

  Future getDayAppointment(DateTime selectedDay) async {
    selectedDayList = await AppointmetRequest.getDayAppointment(
        "jawsubak,sinhee0424", selectedDay);
    setState(() {
      selectedDayList;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    getMonthAppointment();
    getDayAppointment(_selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(_focusedDay.year - 3),
          lastDay: DateTime(_focusedDay.year + 3),
          locale: widget.language,
          weekendDays: const [DateTime.sunday],
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            leftChevronMargin: EdgeInsets.symmetric(horizontal: 0),
            rightChevronMargin: EdgeInsets.symmetric(horizontal: 0),
            leftChevronPadding:
                EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            rightChevronPadding:
                EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            leftChevronIcon: Icon(
              Icons.chevron_left_rounded,
              size: 35,
              color: Color.fromARGB(255, 248, 108, 189),
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right_rounded,
              size: 35,
              color: Color.fromARGB(255, 248, 108, 189),
            ),
            titleCentered: true,
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            weekendTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red.shade400,
            ),
            todayTextStyle: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 20,
                fontWeight: FontWeight.w600),
            selectedTextStyle: const TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            markerDecoration: const BoxDecoration(
              color: Color.fromARGB(255, 250, 129, 199),
              shape: BoxShape.circle,
            ),
            markerMargin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            markersMaxCount: 1,
          ),
          daysOfWeekHeight: 40,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            weekendStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.red.shade400,
            ),
            decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(20)),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            print("selectedday = $selectedDay, focusedday = $focusedDay");
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          eventLoader: (day) {
            Map<DateTime, List<dynamic>> events = {};
            List<AppointmentModel> list = [];
            for (var appointment in monthAppointmentList) {
              if (day.day == appointment.pickedDateTime.day) {
                list.add(appointment);
                events[day] = list;
              }
            }
            return list;
          },
        ),
        Center(
          child: IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const AddAppointmentScreen();
                      }),
                    )
                  },
              icon: Icon(
                Icons.add_circle_outline_rounded,
                size: 40,
                color: Colors.amber.shade700,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        for (var appointment in selectedDayList)
          AppointmentListWidget(appointment: appointment)
      ],
    );
  }
}
