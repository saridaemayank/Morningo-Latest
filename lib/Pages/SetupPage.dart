import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morningo/Models/NavigatorController.dart';
import 'package:morningo/Models/infoGathering.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:morningo/Models/NavigatorController.dart';
//import 'package:morningo/Models/infoGathering.dart';

// ignore: must_be_immutable
class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  String? nameOf;
  late String age;
  // ignore: non_constant_identifier_names
  String? average_fall_asleep_time;
  String? sleepTime;
  String? wakeTime;

  TextEditingController wakeUpController = TextEditingController();
  TextEditingController sleepController = TextEditingController();
  TextEditingController fallTimeController = TextEditingController();
  /*
  by saving a boolean inside shared preferences pub.dev/packages/shared_preferences, 
  it will be null at first, then after the first launch s et it to true, 
  after that check for that value and display widgets based on it – Basel Abuhadrous Aug 
  */

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Setup',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                  maxLength: 10,
                  onChanged: (context) {
                    nameOf = context.characters.toString();
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),
                    hintText: 'What is your age?',
                    labelText: 'Age *',
                  ),
                  onChanged: (context) {
                    age = context.characters.toString();
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                TextField(
                  controller: fallTimeController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock_clock), labelText: "Fall Time"),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    var resultingDuration = await showDurationPicker(
                      context: context,
                      initialTime: Duration(minutes: 30),
                    ) as Duration;

                    int resultMinute = resultingDuration.inMinutes;
                    var resultingDurationString = "$resultMinute Minutes";
                    print(resultingDurationString);
                    print(resultMinute);

                    if (resultMinute != null) {
                      //String pickedminuteString = resultMinute as String;
                      fallTimeController.text = resultingDurationString;
                      setState(() {
                        //average_fall_asleep_time = resultingDurationString;

                        //set the value of text field.
                        //average_fall_asleep_time = pickedminuteString;
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                TextField(
                  controller:
                      wakeUpController, //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.bed), //icon of text field
                      labelText:
                          "Average Time You Wake Up" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      String pickedTimeString = pickedTime.format(context);
                      setState(() {
                        wakeUpController.text =
                            pickedTimeString; //set the value of text field.
                        wakeTime = pickedTimeString;
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                TextField(
                  controller:
                      sleepController, //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.snooze), //icon of text field
                      labelText:
                          "When do you go to sleep Night?" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      String pickedTimeString = pickedTime.format(context);

                      setState(() {
                        sleepController.text =
                            pickedTimeString; //set the value of text field.
                        sleepTime = pickedTimeString;
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     icon: Icon(Icons.snooze),
                //     hintText: 'Sleep Time',
                //     labelText: 'When do you goto sleep Night? *',
                //   ),
                //   onChanged: (context) {
                //     sleepTime = context.characters.toString();
                //   },
                // ),
                const SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 30),
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0xffA0E7E5),
                      elevation: 10,
                    ),
                    onPressed: () async {
                      InfoGateherer collector = InfoGateherer(
                        nameOf,
                        int.parse(age),
                        average_fall_asleep_time,
                        sleepTime,
                        wakeTime,
                      );
                      // Set All Things In Variable; Maybe Put All This In String!

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString("@collectionName", collector.name!);

                      prefs.setBool("@firstLaunch", true);
                      TodoRouteController()
                          .navigateHomeWithCollection(context, collector);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      // Container(
                      //   width: 212,
                      //   height: 66,
                      //   padding: const EdgeInsets.symmetric(horizontal: 30),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(33.0),
                      //     color: const Color(0xffff0000),
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         color: Color(0x29212020),
                      //         offset: Offset(0, 12),
                      //         blurRadius: 12,
                      //       ),
                      //     ],
                      //   ),
                      //   child: TextButton(
                      //     style: TextButton.styleFrom(
                      //       primary: Colors.white,
                      //     ),
                      //     onPressed: () async {
                      //       InfoGateherer collector = InfoGateherer(
                      //         nameOf,
                      //         int.parse(age),
                      //         average_fall_asleep_time,
                      //         sleepTime,
                      //         wakeTime,
                      //       );
                      //       // Set All Things In Variable; Maybe Put All This In String!

                      //       SharedPreferences prefs =
                      //           await SharedPreferences.getInstance();
                      //       await prefs.setString("@collectionName", collector.name!);

                      //       prefs.setBool("@firstLaunch", true);
                      //       TodoRouteController()
                      //           .navigateHomeWithCollection(context, collector);
                      //     },
                      //     child: const Text(
                      //       'Done',
                      //       style: TextStyle(
                      //         fontFamily: 'Gotham',
                      //         fontSize: 25,
                      //         color: Color(0xffffffff),
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //       textAlign: TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
