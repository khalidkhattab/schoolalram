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
      required this.rTime});

  SchoolTable.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    classTitle = json['classTitle'];
    teacher = json['teacher'];
    time = json['time'];
    image = json['image'];
    index = json['index'];
    rTime = json['rTime']!;
  }
}

const String class1Time = "09:30:00";
const String class2Time = "10:05:00";
const String examTime = "10:40:00";
const String break1Time = "11:05:00";
const String class3Time = "11:20:00";
const String class4Time = "11:55:00";
const String break2Time = "12:30:00";
const String class5Time = "12:50:00";
const String class6Time = "13:25:00";

List<SchoolTable> ourTable = [];

// List<SchoolTable> ourTable = [
//   SchoolTable(
//       day: 'SUNDAY',
//       classTitle: '10-1',
//       teacher: 'none',
//       time: '21:05:00',
//       image: 'atach.jpg',
//       index: 0,
//       rTime: 0),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class1Time,
//       image: 'noclass.png',
//       index: 1,
//       rTime: 35),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: '10-1',
//       teacher: 'abdullah',
//       time: class2Time,
//       image: 'abod.jpg',
//       index: 2,
//       rTime: 35),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: 'Exam',
//       teacher: 'Exam',
//       time: examTime,
//       image: 'exam.png',
//       index: 4,
//       rTime: 20),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: 'Break',
//       teacher: 'Break1',
//       time: break1Time,
//       image: 'break.jpg',
//       index: 4,
//       rTime: 10),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: '11A1',
//       teacher: 'Mohamed',
//       time: class3Time,
//       image: 'bloshy.jpg',
//       index: 3,
//       rTime: 35),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: '12A2',
//       teacher: 'Ahmed',
//       time: class4Time,
//       image: 'atach.jpg',
//       index: 5,
//       rTime: 35),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: 'Break',
//       teacher: 'Break2',
//       time: break2Time,
//       image: 'break.jpg',
//       index: 7,
//       rTime: 20),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: '10-2',
//       teacher: 'Abdalaziz',
//       time: class5Time,
//       image: 'aziz.jpg',
//       index: 6,
//       rTime: 35),
//   SchoolTable(
//       day: 'Sunday',
//       classTitle: '12D1',
//       teacher: 'Ahmed',
//       time: class6Time,
//       image: 'atach.jpg',
//       index: 8,
//       rTime: 35),
//   SchoolTable(
//       day: 'MONDAY',
//       classTitle: '10-1',
//       teacher: 'none',
//       time: '14:12:00',
//       image: 'atach.jpg',
//       index: 0,
//       rTime: 0),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: '11A2',
//       teacher: 'Mohamed',
//       time: class1Time,
//       image: 'bloshy.jpg',
//       index: 1,
//       rTime: 35),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: '10-3',
//       teacher: 'Abdalaziz',
//       time: class2Time,
//       image: 'aziz.jpg',
//       index: 2,
//       rTime: 35),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: 'Break',
//       teacher: 'Exam',
//       time: examTime,
//       image: 'exam.png',
//       index: 4,
//       rTime: 20),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: 'Break',
//       teacher: 'Break1',
//       time: break1Time,
//       image: 'break.jpg',
//       index: 4,
//       rTime: 15),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class3Time,
//       image: 'noclass.png',
//       index: 3,
//       rTime: 35),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class4Time,
//       image: 'noclass.png',
//       index: 5,
//       rTime: 35),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: 'Break',
//       teacher: 'Break2',
//       time: break2Time,
//       image: 'break.jpg',
//       index: 7,
//       rTime: 20),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: '10-8',
//       teacher: 'Ahmed',
//       time: class5Time,
//       image: 'atach.jpg',
//       index: 6,
//       rTime: 25),
//   SchoolTable(
//       day: 'Monday',
//       classTitle: '11D2',
//       teacher: 'abdullah',
//       time: class6Time,
//       image: 'abod.jpg',
//       index: 8,
//       rTime: 25),
//   SchoolTable(
//       day: 'TUESDAY',
//       classTitle: '10-1',
//       teacher: 'none',
//       time: '14:12:00',
//       image: 'atach.jpg',
//       index: 0,
//       rTime: 0),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '10-4',
//       teacher: 'Mohamed',
//       time: class1Time,
//       image: 'bloshy.jpg',
//       index: 1,
//       rTime: 35),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '11A3',
//       teacher: 'Yossef',
//       time: class2Time,
//       image: 'yosef.jpeg',
//       index: 2,
//       rTime: 35),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: 'Break',
//       teacher: 'Exam',
//       time: examTime,
//       image: 'exam.png',
//       index: 4,
//       rTime: 20),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: 'Break',
//       teacher: 'Break1',
//       time: break1Time,
//       image: 'break.jpg',
//       index: 4,
//       rTime: 15),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '12A3',
//       teacher: 'Khalid',
//       time: class3Time,
//       image: 'khalid.jpg',
//       index: 3,
//       rTime: 35),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '10-7',
//       teacher: 'Abdalaziz',
//       time: class4Time,
//       image: 'aziz.jpg',
//       index: 5,
//       rTime: 35),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: 'Break',
//       teacher: 'Break2',
//       time: break2Time,
//       image: 'break.jpg',
//       index: 7,
//       rTime: 20),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '12D3',
//       teacher: 'Khalid',
//       time: class5Time,
//       image: 'khalid.jpg',
//       index: 6,
//       rTime: 35),
//   SchoolTable(
//       day: 'Tuesday',
//       classTitle: '10-5',
//       teacher: 'Abdalaziz',
//       time: class6Time,
//       image: 'aziz.jpg',
//       index: 8,
//       rTime: 35),
//   SchoolTable(
//       day: 'WEDNESDAY',
//       classTitle: '10-1',
//       teacher: 'none',
//       time: '14:12:00',
//       image: 'atach.jpg',
//       index: 0,
//       rTime: 0),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: '10-6',
//       teacher: 'Abdalaziz',
//       time: class1Time,
//       image: 'aziz.jpg',
//       index: 1,
//       rTime: 35),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: '12A4',
//       teacher: 'Yossef',
//       time: class2Time,
//       image: 'yosef.jpeg',
//       index: 2,
//       rTime: 35),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: 'Exam',
//       teacher: 'Exam',
//       time: examTime,
//       image: 'exam.png',
//       index: 3,
//       rTime: 20),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: 'Break',
//       teacher: 'Break1',
//       time: break1Time,
//       image: 'break.jpg',
//       index: 4,
//       rTime: 15),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: '11A4',
//       teacher: 'Mohamed',
//       time: class3Time,
//       image: 'bloshy.jpg',
//       index: 5,
//       rTime: 35),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class4Time,
//       image: 'noclass.png',
//       index: 6,
//       rTime: 35),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: 'Break',
//       teacher: 'Break2',
//       time: break2Time,
//       image: 'break.jpg',
//       index: 7,
//       rTime: 20),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class5Time,
//       image: 'noclass.png',
//       index: 8,
//       rTime: 35),
//   SchoolTable(
//       day: 'Wednesday',
//       classTitle: '12D4',
//       teacher: 'Ahmed',
//       time: class6Time,
//       image: 'atach.jpg',
//       index: 9,
//       rTime: 35),
//   SchoolTable(
//       day: 'THURSDAY',
//       classTitle: '10-1',
//       teacher: 'none',
//       time: '14:12:00',
//       image: 'atach.jpg',
//       index: 0,
//       rTime: 0),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: '12A5',
//       teacher: 'Yossef',
//       time: class1Time,
//       image: 'yosef.jpeg',
//       index: 1,
//       rTime: 35),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: '11A5',
//       teacher: 'abdullah',
//       time: class2Time,
//       image: 'abod.jpg',
//       index: 2,
//       rTime: 35),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: 'Exam',
//       teacher: 'Exam',
//       time: examTime,
//       image: 'exam.png',
//       index: 4,
//       rTime: 20),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: 'Break',
//       teacher: 'Break1',
//       time: break1Time,
//       image: 'break.jpg',
//       index: 4,
//       rTime: 15),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: '12D2',
//       teacher: 'Yossef',
//       time: class3Time,
//       image: 'yosef.jpeg',
//       index: 3,
//       rTime: 35),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: '11D1',
//       teacher: 'abdullah',
//       time: class4Time,
//       image: 'abod.jpg',
//       index: 5,
//       rTime: 35),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: 'Break',
//       teacher: 'Break2',
//       time: break2Time,
//       image: 'break.jpg',
//       index: 7,
//       rTime: 20),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: '12A1',
//       teacher: 'Khalid',
//       time: class5Time,
//       image: 'khalid.jpg',
//       index: 6,
//       rTime: 35),
//   SchoolTable(
//       day: 'Thursday',
//       classTitle: 'Empty',
//       teacher: 'Empty',
//       time: class6Time,
//       image: 'noclass.png',
//       index: 8,
//       rTime: 35),
// ];


class SchoolAlert{
  late String title;
  late String subject;
  late String sender;
  late bool read;


  SchoolAlert.formJson(Map<String, dynamic> json){
    title=json['title'];
    subject=json['subject'];

    sender=json['sender'];
    read= json['read'];
  }
}

List<SchoolAlert> alertData=[];