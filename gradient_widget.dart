import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    this.width,
    this.height,
    this.opacity,
    this.colorsList,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });
  
  final double width;
  final double height;
  final double opacity;
  final Alignment begin;
  final Alignment end;
  final List<Color> colorsList;
  
  @override
  Widget build(BuildContext context) {
    List<Color> auxColorsList = colorsList;

    if(auxColorsList == null) auxColorsList = setDefaultColorsList(context);

    else if(auxColorsList.length <= 1) auxColorsList = singleColorTreatment(auxColorsList);

    if(opacity != null) auxColorsList = setTransparency(auxColorsList, opacity);
  
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: auxColorsList,
        )
      ),
    );
  }
  
  List<Color> setDefaultColorsList(BuildContext context) {
    List<Color> colors = [
      Theme.of(context).primaryColor,
      Colors.black,
    ];

    return colors;
  }
  
  List<Color> singleColorTreatment(List<Color> auxColorsList)  => [auxColorsList[0], auxColorsList[0]];

  List<Color> setTransparency(List<Color> auxColorsList, double opacity) {
    for(int i = 0; i < auxColorsList.length; i++)
      auxColorsList[i] = auxColorsList[i].withOpacity(opacity);

    return auxColorsList;
  }
}
