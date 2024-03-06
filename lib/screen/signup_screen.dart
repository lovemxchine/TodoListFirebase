import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwdController = TextEditingController();

  final confirmController = TextEditingController();

  signUpWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwdController.text);
      print('Create successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('the password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
    }

    // print('Failure : ${er.code}');
    // print(e.message);
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              backgroundColor: Colors.amberAccent,
              title: const Text('AlertDialog Title'),
              content: Text(txtMsg),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Ok'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Column(children: [
          const Spacer(),
          Text(
            'Welcome to our community',
            style: GoogleFonts.mitr(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Text(
            ':P',
            style: GoogleFonts.mitr(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
              controller: nameController,
              hintText: 'Enter your name',
              obscureText: false,
              labelText: 'Name'),
          const SizedBox(height: 20),
          MyTextField(
              controller: emailController,
              hintText: 'Enter your email',
              obscureText: false,
              labelText: 'Email'),
          const SizedBox(height: 20),
          MyTextField(
              controller: passwdController,
              hintText: 'Enter your password',
              obscureText: true,
              labelText: 'Password'),
          const SizedBox(height: 20),
          MyTextField(
              controller: confirmController,
              hintText: 'Confirm your password',
              obscureText: true,
              labelText: 'Confirm Password'),
          const SizedBox(height: 20),
          MyButton(onTap: signUpWithEmail, hinText: 'Sign Up'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  'SignIn now.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
