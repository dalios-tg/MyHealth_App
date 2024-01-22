import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/pages/profile_list.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

// ignore: camel_case_types
class _accountPageState extends State<accountPage> {
//   // log out porcedure
  void logOut() {
    FirebaseAuth.instance.signOut();
  }




Widget logOutButton() => GestureDetector(
  child: Column(
    children: <Widget>[
      TextButton(
        onPressed: () {
          logOut();
        },
        child: Row(
          children: <Widget>[
            SizedBox(width: 25),
            Image(
              image: AssetImage("assets/logout.png"), // Replace with your asset path
              height: 28,
              width: 28,
            ),
            SizedBox(width: 35), // Adjust the spacing between icon and text
            Text(
              "Log Out",
              style: 
                GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87           
              
                    ),
            ),
                  SizedBox(width: 160),
            Image(
                    image: AssetImage(
                        "assets/forward.png"), // Replace with your asset path
                    height: 28,
                    width: 28,
                  ),
          ],
        ),
      )
    ],
  ),
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 3, 226, 215),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                 const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("assets/avatar.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("assets/camra.png"))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amelia Renata",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    
                    height: MediaQuery.of(context).size.height * 0.0900,
                    width: MediaQuery.of(context).size.width * 0.2500,
                    child: Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.0400,
                        width: MediaQuery.of(context).size.width * 0.1500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/callories.png"),
                              filterQuality: FilterQuality.high),
                        ),
                      ),
                      Text(
                        "Calories",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 245, 243, 243)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "103lbs",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      )
                    ]),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0900,
                    width: MediaQuery.of(context).size.width * 0.2500,
                    child: Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.0400,
                        width: MediaQuery.of(context).size.width * 0.1500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/weight.png"),
                              filterQuality: FilterQuality.high),
                        ),
                      ),
                      Text(
                        "Weight",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 245, 243, 243)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "756cal",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      )
                    ]),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0900,
                    width: MediaQuery.of(context).size.width * 0.2500,
                    child: Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.0400,
                        width: MediaQuery.of(context).size.width * 0.1500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/heart.png"),
                              filterQuality: FilterQuality.high),
                        ),
                      ),
                      Text(
                        "Heart rate",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 245, 243, 243)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "215bpm",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                profile_list(
                  image: "assets/heart2.png",
                  title: "My Saved",
                  color: Colors.black87,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                profile_list(
                  image: "assets/appoint.png",
                  title: "Appointmnet",
                  color: Colors.black87,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                profile_list(
                  image: "assets/Chat.png",
                  title: "FAQs",
                  color: Colors.black87,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                profile_list(
                  image: "assets/pay.png",
                  title: "Payment Method",
                  color: Colors.black87,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                logOutButton(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
