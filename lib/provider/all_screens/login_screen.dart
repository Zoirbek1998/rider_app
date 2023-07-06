import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/provider/all_screens/register_screen.dart';

import '../../main.dart';
import '../generated/assets.dart';
import '../widgets/app_button.dart';
import '../widgets/app_input.dart';
import '../widgets/app_toast.dart';
import '../widgets/progress_dialog.dart';
import 'main_screen/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  final emailTextController = TextEditingController();
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
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              marginTop: 40,
              controller: emailTextController,
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
              onTap: (){
                 if(!emailTextController.text.contains("@")){
                  displayToastMessage("Email address is not Valid.");
                }else if(passTextController.text.isEmpty){
                  displayToastMessage("Password is mandatory.");
                }else{
                  loginAndAuthenticateUser(context);
                }

              },
            ),
           const SizedBox(height: 50),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.routeName, (route) => false);
                },
                child:const Text(
                  "Do not have an Account? Register Here.",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async{

    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
         return const ProgressDialog(message: "Please wait...",);
    });

    final firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passTextController.text.trim())
        .catchError((erMsg) {
          Navigator.pop(context);
      displayToastMessage("Error: $erMsg");
    }))
    .user;

    if (firebaseUser != null) {

      userRef.child(firebaseUser.uid).once().then((value){
        if(value.snapshot.value != null){
          Navigator.pop(context);
          displayToastMessage("You are logged-in now");

          Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false);

        }else{
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("No record exists for this user. Plase create new account");
        }
      });

    } else {
      Navigator.pop(context);
      displayToastMessage("Error Occured,can not ");
    }
  }
}


