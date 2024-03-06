import 'package:firebase/screen/todolist_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';
import '../component/myimage_button.dart';
import 'package:firebase/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // get signInWithEmailAndPassword => null ;
  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog('Login Successfully');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code : ${e.code}');
      print(e.message);
      // _showMyDialog('No user found / Wrong password');
    }
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
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ToDoListScreen())),
                    child: const Text('Ok'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(children: [
            const Spacer(),
            Text(
              "Hello World Application",
              textAlign: TextAlign.center,
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
              controller: emailController,
              hintText: "Enter your Email",
              obscureText: false,
              labelText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: passwordController,
              hintText: "Enter your password",
              obscureText: true,
              labelText: "Password",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Forgot บ่อ้าย',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.mitr(
                        textStyle: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: signInWithEmailAndPassword,
              hinText: 'Sign In',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Or continue with',
                  style: GoogleFonts.mitr(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.blue,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(imagPath: 'assets/images/google.png'),
                SizedBox(
                  width: 10,
                ),
                MyIconButton(imagPath: 'assets/images/facebook.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member ?',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.mitr(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      'Register now ',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.mitr(
                        textStyle: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
              ],
            ),
            const Spacer()
          ]),
        ),
      ),
    );
  }
}
