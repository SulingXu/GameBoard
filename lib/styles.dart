import 'package:flutter/material.dart';

abstract class Styles {
  static double largeFontSize = 20.0;
  static double middleFontSize = 18.0;
  static double largeRadiusSize = 25.0;
  static double smallRadiusSize = 15.0;

  static EdgeInsets paddingInButton = const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0);

  static RoundedRectangleBorder borderRadius(double radiusSize) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusSize),
    );
  }

  static ButtonStyle starGameButtonStyle = ElevatedButton.styleFrom(//Button's style
   primary: Colors.amber,//change background color of button
   onPrimary: Colors.black,//change text color of button
   shape: borderRadius(largeRadiusSize),
  );

  static Widget text(String txtString, FontWeight fontWeight, double size, Color color) {
    return Text(
        txtString,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          color: color,
        )
    );
  }

}
