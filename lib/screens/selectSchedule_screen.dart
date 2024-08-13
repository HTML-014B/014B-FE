import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;
  Event(this.title);
}

class SelectScheduleScreen extends StatefulWidget {
  @override
  State<SelectScheduleScreen> createState() => _SelectScheduleScreenState();
}

class _SelectScheduleScreenState extends State<SelectScheduleScreen> {
  /** 달력 */
  //late Map<DateTime, List<Event>> _events;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  //late List<DateTime> _selectedDays;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  //DateTime? _selectedEndDate;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  final price = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/calender.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                        child: TableCalendar(
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: _onDaySelected,
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      onRangeSelected: _onRangeSelected,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      calendarStyle: CalendarStyle(
                        rangeStartTextStyle:
                            TextStyle(color: Colors.black), // 범위 시작일 글자색
                        rangeEndTextStyle: TextStyle(color: Colors.black),
                        rangeStartDecoration: BoxDecoration(
                          color: Color(0xffE6F7B4),
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: BoxDecoration(
                          color: Color(0xffE6F7B4),
                          shape: BoxShape.circle,
                        ),
                        rangeHighlightColor: Color(0xffDFF797),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xffF7ECB4),
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          color: Color(0xffF7ECB4),
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: TextStyle(color: Colors.black),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                    )),
                    SizedBox(height: 20),
                    Text(
                      'Selected range: ${_rangeStart?.toLocal()} - ${_rangeEnd?.toLocal()}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ))));
  }
}
