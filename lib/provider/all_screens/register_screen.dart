import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:rider_app/main.dart';


import '../generated/assets.dart';
import '../widgets/app_button.dart';
import '../widgets/app_input.dart';
import '../widgets/app_toast.dart';
import '../widgets/progress_dialog.dart';
import 'login_screen.dart';
import 'main_screen/main_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 66),
            Image.asset(
              Assets.imagesLogo,
              height: 250,
              width: 300,
              alignment: Alignment.center,
            ),
            const Text("Login as a Rider",
                style: TextStyle(fontSize: 24, fontFamily: "bold"),
                textAlign: TextAlign.center),
            AppInput(
              hintText: "Name",
              marginTop: 40,
              controller: nameTextController,
            ),
            AppInput(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              controller: emailTextController,
            ),
            AppInput(
              hintText: "Phone",
              textInputType: TextInputType.phone,
              controller: phoneTextController,
            ),
            AppInput(
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              controller: passTextController,
            ),
            AppButton(
              text: "Login",
              marginTop: 40,
              onTap: () {
                if (nameTextController.text.length < 4) {
                  displayToastMessage("Name must be atleast 3 characters.");
                }else if(!emailTextController.text.contains("@")){
                  displayToastMessage("Email address is not Valid.");
                }else if(phoneTextController.text.isEmpty){
                  displayToastMessage("Phone Number is mandatory.");
                }else if(passTextController.text.length<6){
                  displayToastMessage("Password must be atleast 6 Characters.");
                }else{
                  registerNewUser(context);
                }
              },
            ),
            const SizedBox(height: 50),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                },
                child: const Text(
                  "Already have an Account? Login Here.",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {

    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
          return const ProgressDialog(message: "Please wait...",);
        });


    final firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextController.text,
                password: passTextController.text)
            .catchError((erMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: $erMsg");
    }))
        .user;

    /// create User
    if (firebaseUser != null) {
      /// save user info to database

      Map userDataMap = {
        "name":nameTextController.text.trim(),
        "email":emailTextController.text.trim(),
        "phone":phoneTextController.text.trim(),
      };
      Navigator.pop(context);
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulations, your account has been created.");

      Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false);
    } else {
      /// error accured - display error msg
      ///       Navigator.pop(context);
      displayToastMessage("New user account has not been Created.");
    }
  }
}
