import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'Log Out',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
