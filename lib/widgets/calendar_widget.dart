import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final String language;
  final List appointmentList;
  const CalendarWidget({
    super.key,
    required this.language,
    required this.appointmentList,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidget();
}

class _CalendarWidget extends State<CalendarWidget> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late String language;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime(_focusedDay.year - 3),
      lastDay: DateTime(_focusedDay.year + 3),
      locale: widget.language,
      weekendDays: const [DateTime.sunday],
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronMargin: EdgeInsets.symmetric(horizontal: 0),
        rightChevronMargin: EdgeInsets.symmetric(horizontal: 0),
        leftChevronPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        rightChevronPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
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
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
    );
  }
}
