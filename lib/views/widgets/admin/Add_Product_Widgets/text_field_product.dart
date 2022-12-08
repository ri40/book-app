import 'package:flutter/material.dart';

class ProductTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final bool obscureText;
  final keyboardType;
  final String hintText;
  final Function validator;
  final contentPadding;
  final maxLength;

  ProductTextField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.validator,
      required this.hintText,
      this.contentPadding,
      this.maxLength,
      this.keyboardType,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
          controller: controller,
          //القيم واضحه او مخفيه
          obscureText: obscureText,
          //  تغير لون المؤشر
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          maxLength: maxLength,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            contentPadding: contentPadding,
            fillColor: Color.fromRGBO(248, 248, 248, 1),

            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            //عرض تعبئه text_field
            filled: true,
            enabledBorder: OutlineInputBorder(
              //لون اطار text_field
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            //وظيفه focus لما يتفعل عند الكتابه يكون بدون اطار
            focusedBorder: OutlineInputBorder(
              // لون اطار text_field
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          )),
    );
  }
}
