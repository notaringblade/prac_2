import 'package:flutter/material.dart';
import 'package:prac_2/widgets/neumorph_widget.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.obscure = false,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final bool obscure;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NeumorphWidget(
        child: TextFormField(
          keyboardType: inputType,
          autofocus: false,
          controller: textController,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            // fillColor: Color(0xff4E4E4E),
            fillColor: Color(0xff222222),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide( style: BorderStyle.none),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                // borderSide: const BorderSide(color: Color(0xff4E4E4E)),
                borderSide: const BorderSide( style: BorderStyle.none),

                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  
}
