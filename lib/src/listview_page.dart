import 'package:flutter/material.dart';
import 'package:practica17/src/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemCount: pelis.length,
          itemBuilder: (BuildContext context, int index) {
            final item = pelis[index];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              child: ListTile(
                title: Text(item['title_name']),
                subtitle: Text(item['Genres']),
              ),
              actions: [
                IconSlideAction(
                  caption: 'Agregar',
                  color: Colors.green,
                  icon: Icons.library_add,
                  onTap: () => onDismissed(index,'Agregar'),
                )
              ],
              secondaryActions: [
                IconSlideAction(
                  caption: 'Eliminar',
                  color: Colors.red,
                  icon: Icons.cancel_outlined,
                  onTap: () => onDismissed(index,'Eliminar'),
                )
              ],
            );
          }),
    
    );
  
  }
  onDismissed(int index,String accion){
      setState(() {
        final _snackBar = SnackBar(content: Text('Accion $accion'));
        pelis.removeAt(index);
        switch (accion){
          case 'Agregar':
            ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            break;
          case 'Eliminar':
            ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            break;
        }   
      });
    }
}

