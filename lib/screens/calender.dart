import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calender"),),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,
        dataSource: MeetingDataSource(getAppointment()),
      ),

    );
  }
}
List<Appointment>getAppointment(){
  List<Appointment>meetings =<Appointment>[];
  final DateTime today=DateTime.now();
  final DateTime startTime=
  DateTime(today.year,today.month,today.day,9,0,0);
  final DateTime endTime=startTime.add(const Duration(hours:1));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'game',
      color: Colors.blue
  ));

  return meetings;

}


class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment>source){
    appointments=source;
  }
}