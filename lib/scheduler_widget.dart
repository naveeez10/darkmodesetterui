import 'package:flutter/material.dart';

class SchedulerWidget extends StatefulWidget {
  const SchedulerWidget({Key? key}) : super(key: key);

  @override
  State<SchedulerWidget> createState() => _SchedulerWidgetState();
}

class _SchedulerWidgetState extends State<SchedulerWidget> {
  String currentselectedtime = "10:15";
  String AMorPMstartime = "AM";
  String AMorPMendime = "AM";
  bool schedulenightmode = true;
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
    return Container(
      margin: const EdgeInsets.only(left: 30),
      height: 400,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Schedule Night Mode",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                Switch(
                  // splashRadius: 10,
                  activeTrackColor: Colors.white,
                  value: schedulenightmode,
                  onChanged: (val) {
                    setState(() {
                      schedulenightmode = !schedulenightmode;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.grey,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18),
                child: const Text(
                  "Start Time",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                height: 50,
                width: 140,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: startTimeController,
                        cursorHeight: 27,
                        decoration: const InputDecoration(
                            border: InputBorder.none),
                      ),
                    ),
                    DropdownButton(
                        hint: Text(AMorPMstartime),
                        iconSize: 40,
                        items:
                        <String>['AM', 'PM'].map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            AMorPMstartime = val!;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: const Text(
                  "End Time",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                height: 50,
                width: 140,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: endTimeController,
                        cursorHeight: 27,
                        decoration: const InputDecoration(
                            border: InputBorder.none),
                      ),
                    ),
                    DropdownButton(
                        hint: Text(AMorPMendime),
                        iconSize: 40,
                        items:
                        <String>['AM', 'PM'].map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            AMorPMendime = val!;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: const Text(
                  "Days to Repeat",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 60,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 7),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[0] == false) {
                                isSelected[0] = true;
                                SelectedborderColor[0] = Colors.green;
                                SelectedColor[0] = Colors.white;
                              }
                              else {
                                isSelected[0] = false;
                                SelectedborderColor[0] = Colors.white;
                                SelectedColor[0] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[0],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "M",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[0],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[1] == false) {
                                isSelected[1] = true;
                                SelectedborderColor[1] = Colors.green;
                                SelectedColor[1] = Colors.white;
                              }
                              else {
                                isSelected[1] = false;
                                SelectedborderColor[1] = Colors.white;
                                SelectedColor[1] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[1],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "Tu",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[1],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[2] == false) {
                                isSelected[2] = true;
                                SelectedborderColor[2] = Colors.green;
                                SelectedColor[2] = Colors.white;
                              }
                              else {
                                isSelected[2] = false;
                                SelectedborderColor[2] = Colors.white;
                                SelectedColor[2] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[2],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "W",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[2],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[3] == false) {
                                isSelected[3] = true;
                                SelectedborderColor[3] = Colors.green;
                                SelectedColor[3] = Colors.white;
                              }
                              else {
                                isSelected[3] = false;
                                SelectedborderColor[3] = Colors.white;
                                SelectedColor[3] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[3],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "Th",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[3],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[4] == false) {
                                isSelected[4] = true;
                                SelectedborderColor[4] = Colors.green;
                                SelectedColor[4] = Colors.white;
                              }
                              else {
                                isSelected[4] = false;
                                SelectedborderColor[4] = Colors.white;
                                SelectedColor[4] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[4],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "F",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[4],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[5] == false) {
                                isSelected[5] = true;
                                SelectedborderColor[5] = Colors.green;
                                SelectedColor[0] = Colors.white;
                              }
                              else {
                                isSelected[5] = false;
                                SelectedborderColor[5] = Colors.white;
                                SelectedColor[5] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[5],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "Sa",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[5],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(isSelected[6] == false) {
                                isSelected[6] = true;
                                SelectedborderColor[6] = Colors.green;
                                SelectedColor[6] = Colors.white;
                              }
                              else {
                                isSelected[6] = false;
                                SelectedborderColor[6] = Colors.white;
                                SelectedColor[6] = Colors.grey.shade400;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 22,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: SelectedborderColor[6],
                              child: CircleAvatar(
                                radius: 16,
                                child: const Text(
                                  "Su",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: SelectedColor[6],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
