import 'package:flutter/material.dart';

class NewsBlogStyles {
  static final standardButtonStyles = ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(Colors.red),
      minimumSize: const MaterialStatePropertyAll(Size(200.0, 70.0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Set the corner radius
                ),
      )
    );
  static final standardButtonTextStyles = TextStyle(
    color: Colors.white,
    fontSize: 18
  );
  static final textFieldStyles = TextStyle(
    color: Colors.white,
  );
  static textFieldDecorantion(input_text) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black,
      hintStyle: NewsBlogStyles.textFieldStyles,
      hintText: input_text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
