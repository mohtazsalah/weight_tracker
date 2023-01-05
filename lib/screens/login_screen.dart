import 'package:flutter/material.dart';
import 'package:weight_tracker/components/custom_button.dart';
import 'package:weight_tracker/constants.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  // child: Image.asset('images/logo.png' , color: orangeColor,),
                ),
                const Text(
                  'MessageMe',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: orangeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            CustomButton(text: 'Sign In' ,
              color: orangeColor,
              onPress: (){
                // Navigator.pushNamed(context, SignInScreen.TAG);
              },
            ),
            CustomButton(text: 'register',
              color: blueColor,
              onPress: (){
                // Navigator.pushNamed(context, RegistrationScreen.TAG);
              },
            ),
          ],
        ),
      ),
    );
  }
}
