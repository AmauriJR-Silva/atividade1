import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BotaoVoador extends StatefulWidget {
  const BotaoVoador({super.key});

  @override
  State<BotaoVoador> createState() => _BotaoVoadorState();
}

class _BotaoVoadorState extends State<BotaoVoador> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      child: const Icon(Icons.add_circle),
      onPressed: () {
        _showAddTaskDialog(context);
      },
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    Alert(
      context: context,
      title: "Adicionar Nova Tarefa",
      content: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
            onChanged: (value) {
             
            },
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Descrição',
            ),
            onChanged: (value) {
              
            },
          ),
          SizedBox(height: 16.0), 
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () async {
              selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {}); 
              }
            },
            child: const Text(
              'Definir Prazo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (selectedDate != null && selectedTime != null)
            Text(
              'Prazo: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} às ${selectedTime!.format(context)}',
            ),
        ],
      ),
      buttons: [
        DialogButton(
          child: const Text(
            "Adicionar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            
            Navigator.of(context).pop();
            
          },
          color: Colors.green,
        ),
        DialogButton(
          child: const Text(
            "Cancelar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.red,
        ),
      ],
    ).show();
  }
}
