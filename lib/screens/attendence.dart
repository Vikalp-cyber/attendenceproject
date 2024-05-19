import 'package:attendence/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Attendence extends StatefulWidget {
  const Attendence({super.key});

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  List<int> years = List.generate(9, (index) => 2016 + index);
  int selectedYear = 2016;
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String selectedMonth = 'Jan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: years.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedYear = years[index];
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: selectedYear == years[index]
                            ? MyColors.bgColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        years[index].toString(),
                        style: TextStyle(
                          color: selectedYear == years[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: months.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMonth = months[index];
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: selectedMonth == months[index]
                            ? MyColors.bgColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        months[index],
                        style: TextStyle(
                          color: selectedMonth == months[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AttendenceContainer(context),
            AttendenceContainer(context),
            AttendenceContainer(context),
            AttendenceContainer(context),
            AttendenceContainer(context),
          ],
        ),
      ),
    );
  }

  Container AttendenceContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(color: MyColors.bgColor),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Wed",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const Column(
              children: [
                Text(
                  "Absent",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Overall: 0 Hr",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "Overtime: 0 Hr",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: 30,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Center(
              child: Text(
                "A",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
