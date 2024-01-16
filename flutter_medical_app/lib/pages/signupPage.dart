import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController adresse = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();
  Future SignUn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      addData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Done! Welcome To Our Community"),
        ),
      );

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.of(context).pushNamed("/");
    }
  }

  ///////// Add Data
  void addData() {
    Map<String, dynamic> data = {
      "idUser": "",
      "fullName": name.text,
      "age": age.text,
      "phoneNumber": phone.text,
      "adresse": adresse.text,
      "email": _emailController.text,
    };
    FirebaseFirestore.instance.collection("users").add(data);
  }

  ///////////// email validator
  bool validEmail() {
    final bool isValid = EmailValidator.validate(_emailController.text.trim());
    if (isValid == false) {
      return false;
    } else {
      return true;
    }
  }

// pass confirmation
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _ConfirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmPasswordController.dispose();
  }

  void OpenloginPage() {
    Navigator.of(context).pushReplacementNamed("loginPage");
  }

  //////////  show password
  bool _obscureText = true;
  bool _obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Text("SIGN UP ",
                            style: GoogleFonts.roboto(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00dca6),
                            )),
                      ],
                    ),
                  ),
                  //subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Text("Welcome,  Feel free to create your account",
                            style: GoogleFonts.roboto(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // // name textfiled
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Full Name ",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value.length > 3 &&
                                isAlpha(value.replaceAll(" ", ""))) {
                              return null;
                            } else if (isAlpha(value.replaceAll(" ", "")) ==
                                false) {
                              return "Your Name Should Be contains only letters";
                            } else if (value.length < 3 && value.isNotEmpty) {
                              return " Your Name Should Be > 3 ";
                            } else {
                              return "Write Your Name Please";
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  //age textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: age,
                          decoration: InputDecoration(
                            labelText: "Age",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Age Please";
                            } else if (int.tryParse(value)! < 12) {
                              return " Your Age Should Be > 12 ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  // // adresse textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: adresse,
                          decoration: InputDecoration(
                            labelText: "Adresse",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Adresse Please";
                            } else if (value.length < 3) {
                              return "Enter A Valid Adresse Please ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  // phone Number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value.replaceAll(" ", "").length == 8 &&
                                isAlpha(value.replaceAll(" ", "")) == false) {
                              return null;
                            }
                            if (value.isEmpty) {
                              return "Enter Your Phone Number Please";
                            } else {
                              return "Enter A Valid Phone Number Please";
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  ///////////email textfiled

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Email Please";
                            } else if (validEmail() == false) {
                              return "Enter A Valid Email Please ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  //pass textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Password Please";
                            } else if (value.length < 10) {
                              return "your Password Should Be > 10 Characters ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  //confirm pass textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _ConfirmPasswordController,
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirme Your Password Please";
                            } else if (passwordConfirmed() == false) {
                              return "Wrong! Check Your Password Confirmation ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: SignUn,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xFF00dca6),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text("Sign up",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                    ),
                  ),

                  //text sign up
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a member ?",
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: OpenloginPage,
                          child: Text(
                            "Sign In Here ",
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00dca6),
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
