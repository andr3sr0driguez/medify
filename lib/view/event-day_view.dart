import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventDayView extends StatefulWidget {
  final DateTime fechaSeleccionada;
  

  EventDayView({required this.fechaSeleccionada});

  @override
  State<EventDayView> createState() => _EventDayViewState();
}

class _EventDayViewState extends State<EventDayView> {
  
  @override
  Widget build(BuildContext context) {
  print(widget.fechaSeleccionada);
    return Scaffold(
      backgroundColor: Colors.black, // Fondo oscuro
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add, size: 40,color: Colors.blue,))],
        centerTitle: true,
        // leading: Icon(Icons.arrow_back, color: Colors.white), // Icono de retroceso blanco
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: widget.fechaSeleccionada,
            calendarFormat: CalendarFormat.week,
            // selectedDayPredicate: (day) => isSameDay(widget.fechaSeleccionada, day),
            currentDay: widget.fechaSeleccionada,
          
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
             
              
              outsideDaysVisible: false,
            ),
            headerVisible: false,
          ),
          
          Expanded(
            child: ListView.builder(
              
              itemCount: 24,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50, // Altura fija para cada elemento
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[600]!, // Línea gris
                         // Ancho de línea
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index < 10 ? '0$index:00' : '$index:00',
                        style: TextStyle(color: Colors.white, fontSize: 16), // Estilo del texto
                      ),
                      // Aquí puedes agregar otros widgets, como un ícono o un texto para mostrar eventos
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
