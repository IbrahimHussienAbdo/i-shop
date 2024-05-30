import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/Home/HomeScreen.dart';
import 'package:flash_chat/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../utilities/constants.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance ;
  late String email ;
  late String password;
   bool showSpinner =false ;

  void _showPopupMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon:  const Icon(
            Icons.error ,
            size: 50,
            color: Colors.red,
          ),
          title: const Text('problem with Sign up !'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Got it!'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner ,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              // logo
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'I Shop ',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 120),)
                  ],
                ),
              ),


              const SizedBox(
                height: 48.0,
              ),

              // enter email field
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 20,
                ),
                onChanged: (value) {
                 email = value ;
                },
                decoration: KTextFieldInputDecoration.copyWith(hintText: 'Enter your E-mail') ,
              ),


              const SizedBox(
                height: 8.0,
              ),

              // enter password field
              TextField(

                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                obscureText: true,
                style: TextStyle(
                  fontSize: 20,
                ),
                onChanged: (value) {
                  password = value ;
                },
                decoration: KTextFieldInputDecoration.copyWith(hintText: 'Enter your Password'),
              ),


              const SizedBox(
                height: 24.0,
              ),


              // signup button
              Button(
                  color: secondcolor,
                  buttontext: 'Register',
                  onpressed: ()

                  // sign up functionality
                     async {
                    setState(() {
                      showSpinner = true ;
                    });
                          try {
                              final newuser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
                              if (newuser != null) {
                                Navigator.pushNamed(context, 'HomeScreen');
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                              }
                          catch (e)
                         {
                           setState(() {
                             showSpinner =false;
                           });
                           _showPopupMessage(context);
                         }
                   }
                   )

            ],
          ),
        ),
      ),
    );
  }
}
