import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void OpenSignupPage() {
    Navigator.of(context).pushReplacementNamed("signupPage");
  }

  void OpenResetPasswordPage() {
    Navigator.of(context).pushReplacementNamed("resetPasswordPage");
  }

// sign IN
  Future validSignIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if ((validEmail() == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Not a Valid Email"),
          ),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User Not Found Please Create Your Account First"),
          ),
        );
      } else if ((validPassword() == false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Not a Valid Password"),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Wrong Password"),
          ),
        );
      }
    }
  }

// // email validator
  bool validEmail() {
    final bool isValid = EmailValidator.validate(_emailController.text.trim());
    if ((isValid == false)) {
      return false;
    } else {
      return true;
    }
  }

// passwprd validator
  bool validPassword() {
    if (_passwordController.text.trim() == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  //show password
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Text(
                        "Hello,",
                        style: GoogleFonts.roboto(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00dca6),
                        ),
                      ),
                    ],
                  ),
                ),
                //subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "Login now.",
                        style: GoogleFonts.roboto(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "Welcome back,Please fill the form",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        "to sign in and continue ",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //email textfiled

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: TextFormField(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Adresse e-mail",
                          labelStyle: TextStyle(
                              color: Color(0xFF00dca6),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        autofillHints: [AutofillHints.email],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //pass textfield
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: validSignIn,
                    child: Container(
                      padding: EdgeInsets.all(21),
                      decoration: BoxDecoration(
                          color: Color(0xFF00dca6),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //text sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont' have an account?",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: OpenSignupPage,
                      child: Text(
                        "Register now",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00dca6),
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: OpenResetPasswordPage,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
