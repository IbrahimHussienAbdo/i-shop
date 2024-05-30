import 'package:flash_chat/screens/Sign/login_screen.dart';
import 'package:flash_chat/screens/Sign/registration_screen.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../utilities/widgets.dart';

class WelcomeScreen extends StatefulWidget {
 static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this ,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    controller.addListener(() {
      setState(() {});

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            // logo & name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


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
              ],
            ),

            const SizedBox(
              height: 170.0,
            ),

            // log in button
            Button(
                color: firstcolor,
                buttontext: 'Log In',
                onpressed:  () {Navigator.pushNamed(context, 'LoginScreen');}
                    ),


            // sign up button
            Button(
                color: Colors.black,
                buttontext: 'Register',
                onpressed:  () {Navigator.pushNamed(context, 'RegistrationScreen');}
                    ),

          ],
        ),
      ),
    );
  }
}



