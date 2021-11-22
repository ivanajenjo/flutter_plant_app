import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../detail_plant_screen_v2.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailPlantScreenV2 widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.plant.nombre}\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: widget.plant.ubicacion,
                  style: TextStyle(
                    fontSize: 20,
                    color: widget.plant
                        .getColor(), //Cambia el color en funcion de cuando se haya regado por ultima vez la planta
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
