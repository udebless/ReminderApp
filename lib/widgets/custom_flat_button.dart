import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final Color color;

  

  final String buttonName;
  final Function()? onPressed;
  const CustomFlatButton({
    Key? key,
    required this.buttonName,
    this.onPressed,
    required this.color,
    // required this.imageIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Text(buttonName),
          ],
        ),
        style: TextButton.styleFrom(
          //side: BorderSide(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
         // primary: Colors.green,
        backgroundColor: color,
         // onSurface: Colors.white10,
          textStyle: TextStyle(fontSize: 25),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
