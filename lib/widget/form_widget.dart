import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController fieldController;

  FormWidget({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.fieldController,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late bool _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //DESIGN
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.orange),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
              )
            : null,
      ),

      //FUNCTION
      controller: widget.fieldController,
      obscureText: _obscureText,
    );
  }
}
