import 'package:flutter/material.dart';
import 'package:weight_tracker/components/custom_button.dart';
import 'package:weight_tracker/components/text_form.dart';
import 'package:weight_tracker/constants.dart';

class SignInScreen extends StatefulWidget {
  static String TAG = 'welcome_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _auth = FirebaseAuth.instance;

  late String email ;
  late String password ;
  bool loader = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loader,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150,
                child: Image.asset('images/logo.png'),
              ),
              const SizedBox(height: 20,),
              CustomTextForm(
                type: TextInputType.emailAddress,
                obscure: false,
                hint: 'Enter your email',
                onChange: (value){
                  email = value;
                },
              ),
              const SizedBox(height: 8,),
              CustomTextForm(
                type: TextInputType.text,
                obscure: true,
                hint: 'Enter your password',
                onChange: (value){
                  password = value;
                },
              ),
              SizedBox(height: 10,),
              CustomButton(
                  text: 'Sign In',
                  color: orangeColor,
                  onPress: () async {
                    setState(() {
                      loader = true;
                    });
                    try {
                      // final user2 = await _auth.
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password
                      );
                      if(user != null){
                        Navigator.pushNamed(context, ChatScreen.TAG);
                        setState(() {
                          loader = false;
                        });
                      }
                    }catch (e){
                      print(e);
                      setState(() {
                        loader = false;
                      });
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
