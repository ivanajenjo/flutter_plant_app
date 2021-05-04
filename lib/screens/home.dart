import 'package:flutter/material.dart';
import 'add_plant_screen.dart';
import '../widgets/main_body.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(() {
        //Esto es una chapuza hecha para poder forzar a que la interfaz se actualice ya que no se ha podido implementar correctamente la actualizacion autmatica de la lista de plantas.
        setState(() {});
      }),
      body: MainBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //backgroundColor: kPrimaryColorDark,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPlantScreen(),
            ),
          ).then(
            (value) => setState(
              () {
/*                 final snackBar = SnackBar(
                  content: Text('Nueva Planta añadida'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar); */
              },
            ),
          );
        },
      ),
    );
  }
}
