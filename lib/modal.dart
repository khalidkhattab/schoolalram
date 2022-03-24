import 'dart:core';

class SchoolTable {
  late String day;
  late String classTitle;
  late String teacher;
  late String time;
  late String image;
  late int index;
  late int rTime;
  SchoolTable(
      {required this.day,
      required this.classTitle,
      required this.teacher,
      required this.time,
      required this.image,
        required this.index,
        required this.rTime

      });
}

List<SchoolTable> ourTable = [
  SchoolTable(day: 'SUNDAY', classTitle: '10-1', teacher: 'none', time: '14:12:00', image: 'atach.jpg', index: 0, rTime: 0),
  SchoolTable(day: 'Sunday', classTitle: 'Empty', teacher: 'Empty', time: '07:30:00', image: 'noclass.png', index: 0, rTime: 55),
  SchoolTable(day: 'Sunday', classTitle: '10-1', teacher: 'abdullah', time: '08:30:00', image: 'abod.jpg', index: 1, rTime: 55),
  SchoolTable(day: 'Sunday', classTitle: '11A1', teacher: 'Mohamed', time: '09:30:00', image: 'bloshy.jpg', index: 2,rTime: 55),
  SchoolTable(day: 'Sunday', classTitle: 'Break', teacher: 'Break1', time: '10:25:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Sunday', classTitle: '12A2', teacher: 'Ahmed', time: '10:50:00', image: 'atach.jpg', index: 3,rTime: 55),
  SchoolTable(day: 'Sunday', classTitle: '10-2', teacher: 'Abdalaziz',  time: '11:50:00', image: 'aziz.jpg', index: 4,rTime: 55),
  SchoolTable(day: 'Sunday', classTitle: 'Break', teacher: 'Break2',  time: '12:45:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Sunday', classTitle: '12D1', teacher: 'Ahmed',  time: '13:10:00', image: 'atach.jpg', index: 5,rTime: 55),

   SchoolTable(day: 'MONDAY', classTitle: '10-1', teacher: 'none', time: '14:12:00', image: 'atach.jpg', index: 0, rTime: 0),
  SchoolTable(day: 'Monday', classTitle: '11A2', teacher: 'Mohamed', time: '07:30:00', image: 'bloshy.png', index: 0, rTime: 55),
  SchoolTable(day: 'Monday', classTitle: '10-3', teacher: 'Abdalaziz', time: '08:30:00', image: 'aziz.jpg', index: 1, rTime: 55),
  SchoolTable(day: 'Monday', classTitle: 'Empty', teacher: 'Empty', time: '09:30:00', image: 'noclass.png', index: 2,rTime: 55),
  SchoolTable(day: 'Monday', classTitle: 'Break', teacher: 'Break1', time: '10:25:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Monday', classTitle: 'Empty', teacher: 'Empty', time: '10:50:00', image: 'noclass.png', index: 3,rTime: 55),
  SchoolTable(day: 'Monday', classTitle: '10-8', teacher: 'Ahmed',  time: '11:50:00', image: 'atach.jpg', index: 4,rTime: 55),
  SchoolTable(day: 'Monday', classTitle: 'Break', teacher: 'Break2',  time: '12:45:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Monday', classTitle: '11D2', teacher: 'abdullah',  time: '13:10:00', image: 'abod.jpg', index: 5,rTime: 55),

   SchoolTable(day: 'TUESDAY', classTitle: '10-1', teacher: 'none', time: '14:12:00', image: 'atach.jpg', index: 0, rTime: 0),
  SchoolTable(day: 'Tuesday', classTitle: '10-4', teacher: 'Mohamed', time: '07:30:00', image: 'bloshy.png', index: 0, rTime: 55),
  SchoolTable(day: 'Tuesday', classTitle: '11A3', teacher: 'Yossef', time: '08:30:00', image: 'yosef.jpeg', index: 1, rTime: 55),
  SchoolTable(day: 'Tuesday', classTitle: '12A3', teacher: 'Khalid', time: '09:30:00', image: 'khalid.jpg', index: 2,rTime: 55),
  SchoolTable(day: 'Tuesday', classTitle: 'Break', teacher: 'Break1', time: '10:25:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Tuesday', classTitle: '10-7', teacher: 'Abdalaziz', time: '10:50:00', image: 'aziz.jpg', index: 3,rTime: 55),
  SchoolTable(day: 'Tuesday', classTitle: '12D3', teacher: 'Khalid',  time: '11:50:00', image: 'khalid.jpg', index: 4,rTime: 55),
  SchoolTable(day: 'Tuesday', classTitle: 'Break', teacher: 'Break2',  time: '12:45:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Tuesday', classTitle: '10-5', teacher: 'Abdalaziz',  time: '13:10:00', image: 'aziz.jpg', index: 5,rTime: 55),

  SchoolTable(day: 'WEDNESDAY', classTitle: '10-1', teacher: 'none', time: '14:12:00', image: 'atach.jpg', index: 0, rTime: 0),
  SchoolTable(day: 'Wednesday', classTitle: '10-6', teacher: 'Abdalaziz', time: '07:30:00', image: 'aziz.jpg', index: 0, rTime: 55),
  SchoolTable(day: 'Wednesday', classTitle: '12A4', teacher: 'Yossef', time: '08:30:00', image: 'yosef.jpeg', index: 1, rTime: 55),
  SchoolTable(day: 'Wednesday', classTitle: '11A4', teacher: 'Mohamed', time: '09:30:00', image: 'bloshy.jpg', index: 2,rTime: 55),
  SchoolTable(day: 'Wednesday', classTitle: 'Break', teacher: 'Break1', time: '10:25:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Wednesday', classTitle: 'Empty', teacher: 'Ahmed', time: '20:22:50', image: 'noclass.png', index: 3,rTime: 55),
  SchoolTable(day: 'Wednesday', classTitle: 'Empty', teacher: 'Empty',  time: '11:50:00', image: 'noclass.png', index: 4,rTime: 55),
  SchoolTable(day: 'Wednesday', classTitle: 'Break', teacher: 'Break2',  time: '12:45:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Wednesday', classTitle: '12D4', teacher: 'Ahmed',  time: '13:10:00', image: 'atach.jpg', index: 5,rTime: 55),

  SchoolTable(day: 'THURSDAY', classTitle: '10-1', teacher: 'none', time: '14:12:00', image: 'atach.jpg', index: 0, rTime: 0),
  SchoolTable(day: 'Thursday', classTitle: '12A5', teacher: 'Yossef', time: '07:30:00', image: 'yosef.jpeg', index: 0, rTime: 55),
  SchoolTable(day: 'Thursday', classTitle: '11A5', teacher: 'abdullah', time: '08:30:00', image: 'abod.jpg', index: 1, rTime: 55),
  SchoolTable(day: 'Thursday', classTitle: '12D2', teacher: 'Yossef', time: '09:30:00', image: 'yosef.jpeg', index: 2,rTime: 55),
  SchoolTable(day: 'Thursday', classTitle: 'Break', teacher: 'Break1', time: '10:25:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Thursday', classTitle: '11D1', teacher: 'abdullah', time: '10:50:00', image: 'abod.jpg', index: 3,rTime: 55),
  SchoolTable(day: 'Thursday', classTitle: '12A1', teacher: 'Khalid',  time: '11:50:00', image: 'khalid.jpg', index: 4,rTime: 55),
  SchoolTable(day: 'Thursday', classTitle: 'Break', teacher: 'Break2',  time: '12:45:00', image: 'break.jpg', index: 10,rTime: 25),
  SchoolTable(day: 'Thursday', classTitle: 'Empty', teacher: 'Empty',  time: '13:10:00', image: 'noclass.png', index: 5,rTime: 55),


];
