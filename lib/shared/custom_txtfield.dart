import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTxtfield> createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText=widget.isPassword;
    super.initState();

  }
  void _togglePassword(){
    setState(() {
      _obscureText =!_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:
        widget.isPassword?
        GestureDetector(
          onTap: _togglePassword,
          child: Icon(CupertinoIcons.eye,color: AppColors.primary,),
        ):null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:AppColors.primary),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.primary),
        fillColor: Colors.white,
        filled: true,
      ),
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      validator: (v) {
        if(v==null || v.isEmpty){
          return 'Please fill ${widget.hintText}';
        }
        null;
      },
      obscureText: _obscureText,

    );
  }
}
