import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class restPasswordPage extends StatefulWidget {
  const restPasswordPage({super.key});

  @override
  State<restPasswordPage> createState() => _restPasswordPageState();
}

class _restPasswordPageState extends State<restPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

// verify user

// Send Request button procedure
  Future<void> sendRequest() async {
    if (validEmail() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Not a Valid Email"),
        ),
      );
    } else {
      resetPassword();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Valid Email Check Your Inbox To Reset Your password"),
        ),
      );
    }
    ;
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

//send email function
  Future resetPassword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back_ios),
      //       onPressed: () {
      //         Navigator.of(context).pushReplacementNamed("loginPage");
      //       }),
      // ),
      backgroundColor: Color(0xFFffffff),
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // //image
                Image.asset(
                  "assets/reset.png",
                  height: 300,
                ),

                // //title
                Text("Welcome Back! ",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold,
                        color: Color(0xFF00dca6))),
                SizedBox(
                  height: 5,
                ),
                //subtitle
                Text("You Can Reset Your Password Now ",
                    style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700)),
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // send request button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: GestureDetector(
                    onTap: sendRequest,
                    child: Container(
                      padding: EdgeInsets.all(19),
                      decoration: BoxDecoration(
                          color: Color(0xFF00dca6),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text("Send Request",
                            style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
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
