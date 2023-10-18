import 'package:flutter/material.dart';
import 'package:flutter_authenticator_ui/app_utils.dart';
import 'package:flutter_authenticator_ui/screen/registration_screen.dart';
import 'package:flutter_authenticator_ui/widgets/Primary_Button.dart';
import 'package:flutter_authenticator_ui/widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 20.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      Container(
                        width: 20.0,
                        height: 2.0,
                        decoration: const BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    'JOT',
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 25.0,
                      fontFamily: fontFamily,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Welcome back!",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: fontFamily,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Please enter your details below",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: fontFamily,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              InputField(
                controller: emailController,
                hintText: "Enter you E-Mail",
                icon: Icons.email,
              ),
              const SizedBox(
                height: 20.0,
              ),
              InputField(
                controller: passwordController,
                hintText: "Enter you Password",
                icon: Icons.password,
                obscureText: true,
              ),
              const SizedBox(
                height: 70.0,
              ),
              PrimaryButton(text: "Sign in", onPressed: () {
                if (isValidate()){

                }
    }),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: fontFamily,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationScreen()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: colorWhite,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidate () {
    if (emailController.text.isEmpty){
      showScaffold(context, "Please enter your E-Mail");
      return false;
    }    if (passwordController.text.isEmpty){
      showScaffold(context, "Please enter your Password");
      return false;
    }
    return true;
  }
}
