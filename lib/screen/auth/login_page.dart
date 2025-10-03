import 'package:admin_abzenzee/screen/pages/main_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  late bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.4,
          vertical: MediaQuery.sizeOf(context).height < 800 ? 0.1 : 0.005,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            FCard(
              image: Center(
                child: Lottie.asset(
                  "assets/student with laptop.json",
                  width: MediaQuery.sizeOf(context).width * 0.1,
                ),
              ),
              title: const Text('Account'),
              subtitle: const Text(
                'Make changes to your account here. Click save when you are done.',
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const FTextField(label: Text('Name'), hint: 'John Renalo'),
                  const SizedBox(height: 10),
                  const FTextField.email(
                    label: Text('Email'),
                    hint: 'john@doe.com',
                    error: Text('Invalid email address'),
                  ),
                  const SizedBox(height: 16),
                  FTextField.password(
                    label: Text('Password'),
                    hint: 'Password',
                    obscureText: _obscureText,
                    suffixBuilder: (context, value, child) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? FIcons.eye : FIcons.eyeClosed,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  FButton(
                    onPress: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDashboard(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // child: Container(
      //   width: MediaQuery.sizeOf(context).width * 0.24,
      //   height: MediaQuery.sizeOf(context).height * 0.56,
      //   padding: EdgeInsets.symmetric(horizontal: 30),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Lottie.asset(
      //         "assets/student with laptop.json",
      //         width: MediaQuery.sizeOf(context).width * 0.12,
      //       ),
      //       SizedBox(height: 24),
      //       //login form
      //       //username
      //       FormWidget(
      //         labelText: "Username",
      //         fieldController: userNameController,
      //       ),
      //       SizedBox(height: 12),
      //       //password
      //       FormWidget(
      //         labelText: "Password",
      //         fieldController: passwordController,
      //         obscureText: true,
      //       ),

      //       //login button
      //       SizedBox(height: 24),
      //       Button(
      //         doThis: () {
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(builder: (context) => MainDashboard()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
