import 'package:flutter/material.dart';

import '../app_utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
  });


  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(30)
          ),
          constraints: const BoxConstraints(maxHeight: 55),
          alignment: Alignment.center,
          child:  Text(text, style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: fontFamily,


          ),),
        ),
      ),
    );
  }
}