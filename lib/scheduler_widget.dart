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
  List<Color> SelectedborderColor = List<Color>.filled(7, Colors.grey.shade400);
  List<Color> SelectedTextColor = List<Color>.filled(7, Colors.black);

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 400,
      width: 370,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey.shade400,
                blurRadius: 0)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 3),
                const Text(
                  "Schedule Night Mode",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  child: Switch(
                    // splashRadius: 10,
                    activeTrackColor: Colors.green.shade800,
                    value: schedulenightmode,
                    onChanged: (val) {
                      setState(() {
                        schedulenightmode = !schedulenightmode;
                      });
                    },
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30),
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
                margin: const EdgeInsets.only(left: 27),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    DropdownButton(
                        hint: Text(
                          AMorPMstartime,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.black,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black),
                        items: <String>['AM', 'PM'].map((String value) {
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
                padding: EdgeInsets.only(left: 30),
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
                margin: EdgeInsets.only(left: 30),
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
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    DropdownButton(
                        hint: Text(
                          AMorPMendime,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.black,
                        items: <String>['AM', 'PM'].map((String value) {
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
                padding: EdgeInsets.only(left: 30),
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
                    margin: EdgeInsets.only(left: 16),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[0] == false) {
                                    isSelected[0] = true;
                                    SelectedborderColor[0] = Colors.green;
                                    SelectedColor[0] = Colors.white;
                                    SelectedTextColor[0] = Colors.green;
                                  } else {
                                    isSelected[0] = false;
                                    SelectedborderColor[0] = Colors.grey.shade400;
                                    SelectedColor[0] = Colors.grey.shade400;
                                    SelectedTextColor[0] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[0],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "M",
                                    style: TextStyle(color: SelectedTextColor[0],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[0],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[1] == false) {
                                    isSelected[1] = true;
                                    SelectedborderColor[1] = Colors.green;
                                    SelectedColor[1] = Colors.white;
                                    SelectedTextColor[1] = Colors.green;
                                  } else {
                                    isSelected[1] = false;
                                    SelectedborderColor[1] = Colors.grey.shade400;
                                    SelectedColor[1] = Colors.grey.shade400;
                                    SelectedTextColor[1] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[1],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "Tu",
                                    style: TextStyle(color: SelectedTextColor[1],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[1],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[2] == false) {
                                    isSelected[2] = true;
                                    SelectedborderColor[2] = Colors.green;
                                    SelectedColor[2] = Colors.white;
                                    SelectedTextColor[2] = Colors.green;
                                  } else {
                                    isSelected[2] = false;
                                    SelectedborderColor[2] = Colors.grey.shade400;
                                    SelectedColor[2] = Colors.grey.shade400;
                                    SelectedTextColor[2] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[2],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "W",
                                    style: TextStyle(color: SelectedTextColor[2],fontSize: 14)
                                  ),
                                  backgroundColor: SelectedColor[2],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[3] == false) {
                                    isSelected[3] = true;
                                    SelectedborderColor[3] = Colors.green;
                                    SelectedColor[3] = Colors.white;
                                    SelectedTextColor[3] = Colors.green;
                                  } else {
                                    isSelected[3] = false;
                                    SelectedborderColor[3] = Colors.grey.shade400;
                                    SelectedColor[3] = Colors.grey.shade400;
                                    SelectedTextColor[3] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[3],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "Th",
                                    style: TextStyle(color: SelectedTextColor[3],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[3],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[0] == false) {
                                    isSelected[0] = true;
                                    SelectedborderColor[0] = Colors.green;
                                    SelectedColor[0] = Colors.white;
                                    SelectedTextColor[0] = Colors.green;
                                  } else {
                                    isSelected[0] = false;
                                    SelectedborderColor[0] = Colors.grey.shade400;
                                    SelectedColor[0] = Colors.grey.shade400;
                                    SelectedTextColor[0] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[0],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "F",
                                    style: TextStyle(color: SelectedTextColor[0],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[0],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[5] == false) {
                                    isSelected[5] = true;
                                    SelectedborderColor[5] = Colors.green;
                                    SelectedColor[5] = Colors.white;
                                    SelectedTextColor[5] = Colors.green;
                                  } else {
                                    isSelected[5] = false;
                                    SelectedborderColor[5] = Colors.grey.shade400;
                                    SelectedColor[5] = Colors.grey.shade400;
                                    SelectedTextColor[5] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[5],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "Sa",
                                    style: TextStyle(color: SelectedTextColor[5],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[5],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected[6] == false) {
                                    isSelected[6] = true;
                                    SelectedborderColor[6] = Colors.green;
                                    SelectedColor[6] = Colors.white;
                                    SelectedTextColor[6] = Colors.green;
                                  } else {
                                    isSelected[6] = false;
                                    SelectedborderColor[6] = Colors.grey.shade400;
                                    SelectedColor[6] = Colors.grey.shade400;
                                    SelectedTextColor[6] = Colors.black;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: SelectedborderColor[6],
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text(
                                    "Su",
                                    style: TextStyle(color: SelectedTextColor[6],fontSize: 14),
                                  ),
                                  backgroundColor: SelectedColor[6],
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                          ],
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
