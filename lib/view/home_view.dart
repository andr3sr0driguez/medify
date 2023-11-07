import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medify/src/Provider/PeticionesHttpProvider.dart';
import 'package:medify/src/utils/UI/widget/ButtomCustom/ButtomCustom.dart';
import 'package:medify/src/utils/UI/widget/ButtomCustom/boton_home.dart';
import 'package:medify/view/dieta_view.dart';
import 'package:medify/view/event-day_view.dart';
import 'package:medify/view/medicament_view.dart';
import 'package:medify/view/perfil_view.dart';
import 'package:medify/view/sueno_view.dart';
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
        backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.black,centerTitle: false,title: Text('Bienvenido ${pref.name}'),actions: [ InkWell(child: CircleAvatar(),onTap: (){Navigator.pushNamed(context, Perfil.routeName);},borderRadius: BorderRadius.circular(20)), IconButton(onPressed: (){}, icon: Icon(Icons.reorder))]),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(children: [
               TableCalendar(
              headerStyle: HeaderStyle(titleCentered: true),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              availableCalendarFormats: { CalendarFormat.month: 'Month'},
              calendarStyle: CalendarStyle(outsideDaysVisible: false),// Añade esta línea
              onDaySelected: (selectedDay, focusedDay) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventDayView(fechaSeleccionada: selectedDay)));
              },
            ),
            
                  BotonHome(Text: 'Ejercicios y estiramientos', imagen: 'assets/ejercice.png',
                   onpresed: (){
                  },),
                  BotonHome(Text: 'Medicamentos', imagen: 'assets/medicamentos.png', onpresed: (){
                      Navigator.pushNamed(context, Medicament.routeName);

                  },),
                  BotonHome(Text: 'Dietas', imagen: 'assets/dietas.png', onpresed: (){
                    Navigator.pushNamed(context, Dieta.routeNmae);
                  },),
                  BotonHome(Text: 'Seguimiento de Sueño', imagen: 'assets/sleep.png',onpresed: (){
                    Navigator.pushNamed(context, sueno.routeName);
                  },),
                      
              ]),
            ),
          ),
      ),
    );
  }
}