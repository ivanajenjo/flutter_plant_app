import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../detail_plant_screen_v2.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    @required this.size,
    @required this.widget,
  }) : super(key: key);

  final Size size;
  final DetailPlantScreenV2 widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding * 3,
      ),
      child: SizedBox(
        height: size.height * 0.7,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    IconCard(icon: "assets/icons/sun.svg"),
                    IconCard(icon: "assets/icons/icon_2.svg"),
                    IconCard(icon: "assets/icons/icon_3.svg"),
                    IconCard(icon: "assets/icons/icon_4.svg"),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 60,
                  offset: Offset(0, 10),
                  color: widget.plant.getColor().withOpacity(0.3),
                ),
              ]),
              height: size.height * 0.7,
              width: size.width * 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                child:
                    imageFromBase64StringDetailScreen(widget.plant.photoName),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Image imageFromBase64StringDetailScreen(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
    );
  }
}
