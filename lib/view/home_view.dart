import 'package:flutter/material.dart';
import 'package:medify/src/Provider/PeticionesHttpProvider.dart';
import 'package:medify/widget/button_box.dart';
import 'package:table_calendar/table_calendar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

   static String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(actions: [CircleAvatar()]),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              TableCalendar(

            headerStyle: HeaderStyle(titleCentered: true),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            availableCalendarFormats: { CalendarFormat.month: 'Month'},

          ),
          CustomButton(textButton: 'algo')
          
            ]),
          ),
      ),
    );
  }
}