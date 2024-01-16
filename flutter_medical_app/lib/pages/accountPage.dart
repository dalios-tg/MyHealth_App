import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  
  // log out porcedure
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final topName = coverHeight + profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        actions: [logOutButton()],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(
            top: top,
            child: buildProfilImage(),
          ),
          Positioned(
            top: topName,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Account User Name",
                style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[1000],
                    fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

// cover Image

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/profilCover.png",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
//Profil Image

  Widget buildProfilImage() => CircleAvatar(
        radius: profileHeight / 2,
        child: Image.asset(
          "assets/avatar.png",
        ),
      );

// Log out Button
  Widget logOutButton() => GestureDetector(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4),
              child: IconButton(
                onPressed: () {
                  logOut();
                },
                icon: const Icon(Icons.logout),
                iconSize: 30,
              ),
            ),
          ],
        ),
      );
}
