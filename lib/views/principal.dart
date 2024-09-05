import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildCard(context, 'Tarefa 1', 'Descrição curta da tarefa 1'),
          _buildCard(context, 'Tarefa 2', 'Descrição curta da tarefa 2'),
          _buildCard(context, 'Tarefa 4', 'Descrição curta da tarefa 4'),
          _buildCard(context, 'Tarefa 5', 'Descrição curta da tarefa 5'),
          _buildCard(context, 'Tarefa 6', 'Descrição curta da tarefa 6'),
          _buildCard(context, 'Tarefa 7', 'Descrição curta da tarefa 7'),
          _buildCard(context, 'Tarefa 8', 'Descrição curta da tarefa 8'),
          _buildCard(context, 'Tarefa 9', 'Descrição curta da tarefa 9'),
          _buildCard(context, 'Tarefa 11', 'Descrição curta da tarefa 11'),
          _buildCard(context, 'Tarefa 12', 'Descrição curta da tarefa 12'),
          _buildCard(context, 'Tarefa 13', 'Descrição curta da tarefa 13'),
          _buildCard(context, 'Tarefa 14', 'Descrição curta da tarefa 14'),
          _buildCard(context, 'Tarefa 15', 'Descrição curta da tarefa 15'),
          _buildCard(context, 'Tarefa 16', 'Descrição curta da tarefa 16'),
          _buildCard(context, 'Tarefa 17', 'Descrição curta da tarefa 17'),
          _buildCard(context, 'Tarefa 18', 'Descrição curta da tarefa 18'),
          _buildCard(context, 'Tarefa 19', 'Descrição curta da tarefa 19'),
          _buildCard(context, 'Tarefa 20', 'Descrição curta da tarefa 20'),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String titulo, String descricao) {
    return GestureDetector(
      onDoubleTap: () {
        Alert(
          context: context,
          type: AlertType.info,
          title: "Atenção!",
          desc: "Deseja excluir esta tarefa?",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.blue,
            )
          ],
        ).show();
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListTile(
              title: Text(titulo),
              subtitle: Text(descricao),
            ),
            Positioned(
              right: 8.0,
              top: 8.0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(context, titulo, descricao);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                   
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String titulo, String descricao) {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    Alert(
      context: context,
      title: "Editar Tarefa",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Título',
              hintText: titulo,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Descrição',
              hintText: descricao,
            ),
          ),
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
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
        
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        )
      ],
    ).show();
  }
}
