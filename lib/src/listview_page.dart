import 'package:flutter/material.dart';
import 'package:practica17/src/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          return Slidable(
            key: ValueKey(item['first_name']),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDismissed(index, 'Agregar'),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.library_add,
                  label: 'Agregar',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDismissed(index, 'Eliminar'),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.cancel_outlined,
                  label: 'Eliminar',
                ),
              ],
            ),
            child: ListTile(
              title: Text(item['first_name']),
              subtitle: Text(item['Genres']),
            ),
          );
        },
      ),
    );
  }

  void onDismissed(int index, String accion) {
    setState(() {
      final snackBar = SnackBar(content: Text('Acción: $accion'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      if (accion == 'Eliminar') {
        pelis.removeAt(index);
      }
      // Additional logic can be added for "Agregar" if needed
    });
  }
}
