import 'package:flash_chat/Models/ItemModel.dart';
import 'package:flash_chat/screens/Cart/CartScreen.dart';
import 'package:flash_chat/screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/OnBoarding/welcome_screen.dart';
import 'package:flash_chat/screens/Sign/login_screen.dart';
import 'package:flash_chat/screens/Sign/registration_screen.dart';
import 'package:provider/provider.dart';

Future main() async{
  try{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(

        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ItemModel()),
          ],
          child: const FlashChat(),
        ),


       );
  }
  catch (e)
  {
    print('problem with build app with firebase ');
  }

}

class FlashChat extends StatelessWidget {
  const FlashChat( {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     initialRoute:'WelcomeScreen',
      routes: {

        'WelcomeScreen':(context) => const WelcomeScreen(),
        'HomeScreen':(context) => const HomeScreen(),
        'LoginScreen':(context) => LoginScreen(),
        'RegistrationScreen':(context) => RegistrationScreen(),
        'CartScreen':(context) => const CartScreen(),

      },
    );
  }
}


// TODO: add real items
// TODO: colors of app
// TODO: send