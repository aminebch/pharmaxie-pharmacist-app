import 'package:admin/patientlist.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/upcoming_schedule.dart';

class Schedulepage extends StatefulWidget {
  const Schedulepage({super.key});

  @override
  State<Schedulepage> createState() => _SchedulepageState();
}

class _SchedulepageState extends State<Schedulepage> {
  int _buttonIndex = 0;

  final _schedulewidgets = [
    // Upcoming Widget
    const UpcomingSchedule(),
    DataScreen(),

    //Completed Widget
    Container(),
    // Canceked Widget
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Orders.",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 0
                            ? const Color.fromARGB(255, 4, 125, 255)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              _buttonIndex == 0 ? Colors.white : Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _schedulewidgets[_buttonIndex],
          ],
        ),
      ),
    );
  }
}
