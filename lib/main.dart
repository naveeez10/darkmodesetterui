import 'package:darkmodesetterui/scheduler_widget.dart';
import 'package:flutter/material.dart';
import 'save_button.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NightVision();
  }
}

class NightVision extends StatefulWidget {
  const NightVision({Key? key}) : super(key: key);

  @override
  State<NightVision> createState() => _NightVisionState();
}

class _NightVisionState extends State<NightVision> {
  bool nightVisonMode = false;
  bool automaticmode = false;

  String currentselectedtime = "10:15";
  String AMorPMstartime = "AM";
  String AMorPMendime = "AM";
  var selectedcolor = Colors.grey.shade400;
  var selectedbordercolor = Colors.white;

  List<bool> isSelected = List<bool>.filled(7, false);

  List<String> days = ["M", "Tu", "W", "Th", "F", "Sa", "Su"];

  List<Color> SelectedColor = List<Color>.filled(7, Colors.grey.shade400);
  List<Color> SelectedborderColor = List<Color>.filled(7, Colors.white);

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Night Vision",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.grey.shade500,
                          blurRadius: 7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Night Vision Mode",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Switch(
                      activeTrackColor: Colors.white,
                      splashRadius: 10,
                      value: nightVisonMode,
                      onChanged: (val) {
                        setState(() {
                          nightVisonMode = !nightVisonMode;
                        });
                      },
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.grey,
                    ),
                    // const SizedBox(width: 20,),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SchedulerWidget(),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.grey.shade500,
                          blurRadius: 7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Automatic Mode",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Switch(
                      splashRadius: 10,
                      activeTrackColor: Colors.white,
                      value: automaticmode,
                      onChanged: (val) {
                        setState(() {
                          automaticmode = !automaticmode;
                        });
                      },
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
