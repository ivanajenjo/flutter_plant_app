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
      appBar: buildAppBar(),
      body: NewBody(),
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
                final snackBar = SnackBar(
                  content: Text('Nueva Planta añadida'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        },
      ),
    );
  }
}
