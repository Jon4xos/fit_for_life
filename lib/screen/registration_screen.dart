import 'package:flutter/material.dart';
import 'package:flutter_authenticator_ui/app_utils.dart';
import 'package:flutter_authenticator_ui/screen/login_screen.dart';
import 'package:intl/intl.dart';

import '../widgets/Primary_Button.dart';
import '../widgets/input_field_widget.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
            child: Text(
              "Jack",
              style: TextStyle(
                color: colorWhite,
                fontSize: 28.0,
                fontFamily: 'fontFamily',
                fontWeight: FontWeight.bold,
                 ),
              ),
            ),
            const SizedBox(
              height: 8.0 ,
            ),
            const Center(
              child: Text(
                "of all trades",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontFamily: 'fontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Center(
              child: Text(
                "Please enter your Information",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.0,
                  fontFamily: 'fontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50,),
            InputField(
              controller: nameController,
              icon: Icons.person,
              hintText: "Enter your Name",
            ),
            const SizedBox(height: 20,),
            InputField(
              controller: emailController,
              icon: Icons.email,
              hintText: "Enter you E-Mail",
            ),
            const SizedBox(height: 20,),
            InputField(
              controller: passwordController,
              icon: Icons.password,
              hintText: "Enter you Password",
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 20.0),

              child: TextFormField(
                style: const TextStyle(
                  color: colorWhite,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
                controller: birthDateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month,color: colorWhite, size: 25.0,),
                  hintText: "Enter your Birthday",
                  hintStyle: TextStyle(
                    color: colorGrey,
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                ),
                 onTap: () async { 
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());
                  date =(await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100)))!;
                  String dateFormatter = date.toIso8601String();
                  DateTime dt = DateTime.parse(dateFormatter);
                  var formatter = DateFormat('dd-MMMM-yyyy');
                  birthDateController.text = formatter.format(dt);
                 },
              ),
            ),
            const SizedBox(height: 20,),
              PrimaryButton(
                text: 'Sign up',
               onPressed: (){
                  if(isValidate()){
                    print("Data validated");
                    // Navigate to landing screen after sign up
                  }
               },
             ),
            const SizedBox(height: 20,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Text(
                  "Already have an Account!", style: TextStyle(
                  color: colorWhite,
                  fontFamily: fontFamily,
                ),
               ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()) );
                  },
                  child: const Text(
                    "Sign in", style: TextStyle(
                    color: colorWhite,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,

                  ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
  bool isValidate () {
    if (nameController.text.isEmpty){
      showScaffold(context, "Please enter your Name");
      return false;
    }    if (emailController.text.isEmpty){
      showScaffold(context, "Please enter your E-Mail");
      return false;
    }    if (passwordController.text.isEmpty){
      showScaffold(context, "Please enter your Password");
      return false;
    }    if (birthDateController.text.isEmpty){
      showScaffold(context, "Please enter your date of Birth");
      return false;
    }
    return true;
  }

}





