import 'package:flutter/material.dart';

import 'floating_action_button_green.dart';

class MovieItem extends StatelessWidget {
  String pathImage = "assets/img/poster.jpg";
  MovieItem(this.pathImage);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow> [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0,7.0)
            )
          ],
        image: DecorationImage(
          image: new NetworkImage(pathImage),
          fit: BoxFit.fill,
        )
      ),
    );
    return Stack(
      alignment: Alignment(0.9,1.1),
      children: [
        card,
        //FloatingActionButtonGreen()
      ],
    );
  }

}