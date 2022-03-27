import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_alarm/modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'School Alarm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  final playeres = AudioPlayer();
  late Timer _timer;
  String currentTime = "00:00:00";
  // static AudioCache player = AudioCache();
  final alarmAudioPath = "assets/ring.wav";
  String currentDay = DateFormat('EEEE').format(DateTime.now());
//current class color
  late Color activeColor;
  //countdown time
  int countSeconds = 60;
  int countMinutes = 4;

  //current data
  String currentTeacher = "no data";
  String currentClass = "no data";
  String currentImage = "khalid.jpg";
  String teacherN = "khalid";

  //use to define color of class yellow or red or white
  int currentIndex = 0;

  late List<SchoolTable> selectedTeacher;
// this var to to define teacher in main table
  String currentMainTableTeacher = "none";
  TimeOfDay selectedTime = TimeOfDay.now();

  late List<SchoolTable> dailyTable;
  // late  SchoolTable currentClass;

  late List<SchoolTable> sundayTable;
  late List<SchoolTable> mondayTable;
  late List<SchoolTable> thursdayTable;
  late List<SchoolTable> tuesdayTable;
  late List<SchoolTable> wednesdayTable;

  //list of class by arabic
  List<String> arabicClass = [
    "الحصة الاولي",
    "الحصة الثانية",
    "الحصة الثالثة",
    "الفرصة الاولي",
    "الحصة الرابعة",
    "الحصة الخامسة",
    "الفرصة الثانية",
    "الحصة السادسة",
  ];

  List<Map<String, String>> teacherNameArabic = [
    {'arabic': "خالد خطاب", "english": "Khalid"},
    {'arabic': "احمد اتش", "english": "Ahmed"},
    {'arabic': "محمد البلوشي", "english": "Mohamed"},
    {'arabic': "عبدالله التتان", "english": "abdullah"},
    {'arabic': "يوسف القلاف", "english": "Yossef"},
    {'arabic': "عبدالعزيز القلاف", "english": "Abdalaziz"},
  ];

  //class Color in  dailyTable

  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        classCountDown();

        currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
        // currentDay=DateFormat('EEEE').format(DateTime.now());
        if (currentDay != DateFormat('EEEE').format(DateTime.now())) {
          currentDay = DateFormat('EEEE').format(DateTime.now());
          dailyTable =
              ourTable.where((element) => element.day == currentDay).toList();
        }
        for (var element in dailyTable) {
          if (element.time == currentTime) {
            for (var name in teacherNameArabic) {
              if (element.teacher == name['english']) {
                currentTeacher = name['arabic'].toString();
              }
            }

            currentClass = element.classTitle;
            currentImage = element.image;
            countMinutes = element.rTime;
            countSeconds = 60;
            activeColor = Colors.yellow;
            currentIndex = element.index;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 10),
                content: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.tealAccent,
                      ],
                    )),
                    height: 150,
                    child: Center(
                        child: Text(
                      'بداية الحصة',
                      style: GoogleFonts.cairo(fontSize: 40),
                    ))),
                behavior: SnackBarBehavior.floating,
                margin:
                    const EdgeInsets.only(bottom: 300, left: 300, right: 300),
              ),
            );
          }
        }
      });
    });

    dailyTable = ourTable
        .where((element) => element.day == currentDay)
        .toList(); //&& element.index!=0
    getTablePerDay();
    super.initState();
  }

  void classCountDown() {
    if (countMinutes == 0 && countSeconds == 0) {
      countMinutes = 2;
      countSeconds = 59;
    } else {
      if (countSeconds == 0) {
        countSeconds = 59;
        countMinutes--;
      } else {
        countSeconds--;
      }
    }
  }

  void dayEnd() {
    if (currentTime == "18:16:30") {
      currentIndex == 5;
    } else {
      if (currentTime == "07:00:00") {
        currentIndex == 0;
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> teacherTable(String teacherName) async {
    selectedTeacher =
        ourTable.where((element) => element.teacher == teacherName).toList();
  }

  void getTablePerDay() {
    sundayTable = ourTable
        .where((element) => element.day.toUpperCase() == "SUNDAY")
        .toList();
    //sundayTable = ourTable.where((element) => (element.day.toUpperCase() == "SUNDAY" && element.index!=4 && element.index!=7)).toList();
    mondayTable = ourTable
        .where((element) => element.day.toUpperCase() == "MONDAY")
        .toList();
    tuesdayTable = ourTable
        .where((element) => element.day.toUpperCase() == "TUESDAY")
        .toList();
    wednesdayTable = ourTable
        .where((element) => element.day.toUpperCase() == "WEDNESDAY")
        .toList();
    thursdayTable = ourTable
        .where((element) => element.day.toUpperCase() == "THURSDAY")
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double kWidth =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    double kHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setStat) {
                        return AlertDialog(
                          elevation: 10,
                          title: const Text('جدول القسم'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 50,
                                width: kWidth * .8,
                                child: ListView.builder(
                                    itemCount: teacherNameArabic.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          onPressed: () {
                                            setStat(() {
                                              currentMainTableTeacher =
                                                  teacherNameArabic[index]
                                                          ['english']
                                                      .toString();
                                            });
                                          },
                                          color: currentMainTableTeacher ==
                                                  teacherNameArabic[index]
                                                      ['english']
                                              ? Colors.yellow
                                              : Colors.teal,
                                          height: 30,
                                          minWidth: 100,
                                          child: Text(teacherNameArabic[index]
                                                  ['arabic']
                                              .toString()),
                                        ),
                                      );
                                    }),
                              ),
                              Flexible(
                                child: Container(
                                  width: kWidth * .8,
                                  height: kHeight * .8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal,
                                  ),
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [
                                      tableContainer(sundayTable, kWidth,
                                          currentMainTableTeacher),
                                      tableContainer(mondayTable, kWidth,
                                          currentMainTableTeacher),
                                      tableContainer(tuesdayTable, kWidth,
                                          currentMainTableTeacher),
                                      tableContainer(wednesdayTable, kWidth,
                                          currentMainTableTeacher),
                                      tableContainer(thursdayTable, kWidth,
                                          currentMainTableTeacher),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    });
              },
              icon: const Icon(Icons.list)),
          // IconButton(
          //   onPressed: () {
          //     // _timer.cancel();
          //     //S
          //     //  AudioPlayer().setAsset(alarmAudioPath);
          //    // playeres.setAsset('assets/ring.wav');
          //     // playeres.dispose();
          //   },
          //   icon: const FaIcon(FontAwesomeIcons.sun),
          // ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.dial,
              ).then((value) {
                if (value != null && value != selectedTime) {
                  setState(() {
                    selectedTime = value;
                  });
                }
              });
            },
            icon: const FaIcon(FontAwesomeIcons.clock),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              kWidth > 760
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        partContainer(
                            kWidth,
                            Text(
                              DateFormat('EEEE').format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: kWidth > 1200 ? 40 : (kWidth / 30)),
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: kWidth > 1200 ? 25 : (kWidth / 30)),
                            )),
                        Card(
                          child: SizedBox(
                            width: kWidth > 1200 ? 550 : (kWidth * .42),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentTime,
                                    style: GoogleFonts.abel(
                                        fontSize:
                                            80,
                                        color: Colors.indigo,
                                    fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        partContainer(
                          kWidth,
                          Text('قسم ',
                              style: GoogleFonts.changa(
                                  fontSize:
                                      25)),
                          Text('الحاسوب',
                              style: GoogleFonts.changa(
                                  fontSize:
                                      25)),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: (kWidth * .4),
                                height: 150,
                                child: Card(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('EEEE').format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: kWidth > 1200
                                              ? 20
                                              : (kWidth / 25)),
                                    ),
                                    Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: kWidth > 1200
                                              ? 20
                                              : (kWidth / 30)),
                                    ),

                                    // DateFormat('yyyy-MM-dd')
                                  ],
                                ))),
                            SizedBox(
                                width: (kWidth * 0.4),
                                height: 150,
                                child: Card(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('قسم ',
                                        style:
                                            GoogleFonts.changa(fontSize: 30)),
                                    Text('الحاسوب',
                                        style:
                                            GoogleFonts.changa(fontSize: 30)),

                                    // DateFormat('yyyy-MM-dd')
                                  ],
                                ))),
                          ],
                        ),
                        Card(
                          child: SizedBox(
                            width: kWidth > 1200 ? 500 : (kWidth * .4),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentTime,
                                    style: GoogleFonts.alatsi(
                                        fontSize: kWidth > 1200
                                            ? 110
                                            : (kWidth / 12),
                                    fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                child: Container(
                    color: Colors.teal.shade200,
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: kWidth / 5,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  currentTeacher,
                                  style: GoogleFonts.oswald(fontSize: 30),
                                ), //dailyTable[0].classTitle
                                Text(currentClass,
                                    style: GoogleFonts.oswald(
                                        fontSize: 30)), //dailyTable[0].teacher
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(arabicClass[currentIndex],
                                style: GoogleFonts.cairo(fontSize: 40)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  countMinutes.toString(),
                                  style: const TextStyle(fontSize: 80),
                                ),
                                const Text(
                                  ':',
                                  style: TextStyle(fontSize: 80),
                                ),
                                Text(
                                  countSeconds.toString(),
                                  style: const TextStyle(fontSize: 80),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            teacherTable(currentTeacher)
                                .then((value) => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          title: Text(
                                              'Teacher Table: $currentTeacher'),
                                          content: selectedTeacher.isNotEmpty
                                              ? Container(
                                                  color: Colors.teal.shade200,
                                                  width: 400,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: selectedTeacher
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 3),
                                                          child: Card(
                                                            child: ListTile(
                                                              trailing:
                                                                  CircleAvatar(
                                                                child: Text(
                                                                    (index + 1)
                                                                        .toString()),
                                                              ),
                                                              leading:
                                                                  Container(
                                                                color:
                                                                    Colors.teal,
                                                                height: 80,
                                                                width: 100,
                                                                alignment:
                                                                    AlignmentDirectional
                                                                        .center,
                                                                child: Text(
                                                                  selectedTeacher[
                                                                          index]
                                                                      .day,
                                                                  style: GoogleFonts.changa(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              title: Text(
                                                                  selectedTeacher[
                                                                          index]
                                                                      .classTitle),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                )
                                              : const Text('No Table '));
                                    }));
                          },
                          child: Card(
                            elevation: 7,
                            child: Container(
                              width: kWidth / 5,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.teal.shade200,
                                  image: DecorationImage(
                                      image: AssetImage('images/$currentImage'),
                                      fit: BoxFit.scaleDown)),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              dailyTable.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: dailyTable.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:kWidth>1000? 8:4,
                        crossAxisSpacing: 5,
                        childAspectRatio:kWidth>1000? 0.9:1.5,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 200,
                          child: Card(
                            child: Container(
                              color: dailyTable[index].index == currentIndex
                                  ? Colors.yellow
                                  : dailyTable[index].index > currentIndex
                                      ? Colors.white
                                      : Colors.deepOrange,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    dailyTable[index].classTitle,
                                    style: GoogleFonts.oswald(fontSize: 25),
                                  ),
                                  Text(
                                    dailyTable[index].teacher,
                                    style: GoogleFonts.oswald(fontSize: 25),
                                  ),
                                  Flexible(
                                    child: Text(
                                      dailyTable[index].time,
                                      style: GoogleFonts.oswald(fontSize:25),//fontSize: 25
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Text('No class Today'),
                    ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Stack(
                  //   alignment: Alignment.centerLeft,
                  //   children: [
                  //     Card(
                  //       elevation: 10,
                  //       child: Container(
                  //         // height: 250,
                  //         width: kWidth >750?500:400,
                  //         decoration: const BoxDecoration(
                  //             gradient: LinearGradient(
                  //           begin: Alignment.topRight,
                  //           end: Alignment.bottomLeft,
                  //           colors: [
                  //             Colors.blue,
                  //             Colors.tealAccent,
                  //           ],
                  //         )),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Text(
                  //                 'الحصة التالية',
                  //                 style: GoogleFonts.cairo(fontSize: 30),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 40, vertical: 15),
                  //                 child: Column(
                  //                   children: [
                  //                     Text(
                  //                       dailyTable.length > currentIndex + 1
                  //                           ? dailyTable[currentIndex + 1]
                  //                               .teacher
                  //                           : "finish",
                  //                       style: GoogleFonts.cairo(fontSize: 30),
                  //                     ),
                  //                     Text(
                  //                       dailyTable.length > currentIndex + 1
                  //                           ? dailyTable[currentIndex + 1]
                  //                               .classTitle
                  //                           : "انتهي الدوام",
                  //                       style: GoogleFonts.cairo(fontSize: 30),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       // margin:const  EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                  //     ),
                  //     Card(
                  //       child: Container(
                  //         height:kWidth >750?300: 250,
                  //         width: kWidth >750?200:100,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15.0),
                  //             image: DecorationImage(
                  //                 fit: BoxFit.cover,
                  //                 image: dailyTable.length > currentIndex + 1
                  //                     ? AssetImage(
                  //                         'images/${dailyTable[currentIndex + 1].image}')
                  //                     : const AssetImage(
                  //                         'images/checkbox.png'))),
                  //         child: const Padding(
                  //           padding: EdgeInsets.all(10.0),
                  //         ),
                  //       ),
                  //       // margin:const  EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                  //     ),
                  //     // const CircleAvatar(
                  //     //   minRadius: 50,
                  //     // ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 250,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 250,
                              width: kWidth >750?500:400,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.blue,
                                      Colors.tealAccent,
                                    ],
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 50,),
                                    Text(
                                      'التالي',
                                      style: GoogleFonts.cairo(fontSize: 30),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dailyTable.length > currentIndex + 1
                                                ? dailyTable[currentIndex + 1]
                                                .teacher
                                                : "finish",
                                            style: GoogleFonts.cairo(fontSize: 30),
                                          ),
                                          Text(
                                            dailyTable.length > currentIndex + 1
                                                ? dailyTable[currentIndex + 1]
                                                .classTitle
                                                : "انتهي الدوام",
                                            style: GoogleFonts.cairo(fontSize: 30),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // margin:const  EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                          ),
                        ),
                          CircleAvatar(
                          maxRadius: 70,
                          backgroundColor: Colors.teal,
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              maxRadius: 60,
                              backgroundImage:  dailyTable.length > currentIndex + 1
                                  ? AssetImage(
                                  'images/${dailyTable[currentIndex + 1].image}', )
                                  : const AssetImage(
                                  'images/abod.jpg'),)),
                          )



                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tableContainer(
    List<SchoolTable> table, double kWidth, String currentTeacher) {
  return SizedBox(
    height: 100,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        //physics: const ScrollPhysics(),
        itemCount: table.length,
        itemBuilder: (context, index) {
          return (index != 4 && index != 7)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: SizedBox(
                    height: 80,
                    width: 120,
                    child: Card(
                      elevation: 7,
                      child: Container(
                          decoration: BoxDecoration(
                              color: table[index].teacher == "Empty"
                                  ? Colors.yellowAccent
                                  : currentTeacher == table[index].teacher
                                      ? Colors.cyanAccent
                                      : null,
                              borderRadius: BorderRadius.circular(10)),
                          width: 120,
                          child: Row(
                            children: [
                              Container(
                                  width: 20,
                                  height: double.infinity,
                                  color: index != 0
                                      ? Colors.orangeAccent
                                      : Colors.blue,
                                  child: (index != 0)
                                      ? Text(
                                          (table[index].index + 1).toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : null),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: index == 0
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    index == 0
                                        ? table[index].day
                                        : table[index].classTitle,
                                    style: GoogleFonts.oswald(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Visibility(
                                    visible: index != 0,
                                    child: Text(
                                      table[index].teacher,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                )
              : const Divider(
                  color: Colors.yellow,
                );
        }),
  );
}

Widget partContainer(double kWidth, Widget widget1, Widget widget2) {
  return SizedBox(
      width: kWidth * .2,
      height: 150,
      child: Card(
          elevation: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget1,
              widget2,
            ],
          )));
}
