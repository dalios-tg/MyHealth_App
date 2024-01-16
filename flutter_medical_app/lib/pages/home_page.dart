import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_medical_app/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/widgets/consultationcard.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

final Stream<QuerySnapshot> _user =
    FirebaseFirestore.instance.collection("users").snapshots();

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Welcome back",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "Jessica",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ))
                  ],
                ),
              ),
              TitleBar(title: "Upcoming Consultation"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      consultationcard(
                        color: Color(0xFF0052a8),
                        name: "Michael\nSimpson",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      consultationcard(
                        color: Color(0xFFcde1f3),
                        name: "Kate\nBrown ",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      consultationcard(
                        color: Color.fromARGB(255, 51, 146, 223),
                        name: "Bourchada ",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      consultationcard(
                          color: Color.fromARGB(255, 51, 146, 223),
                          name: "user"),
                    ],
                  ),
                ),
              ),
              TitleBar(title: "Practitioner Profiles"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF00dca6),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        radius: 30,
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/user.png"),
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user2.png")),
                      SizedBox(width: 15),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user3.png")),
                      SizedBox(width: 10),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user4.png")),
                      SizedBox(width: 10),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user5.png")),
                      SizedBox(width: 10),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user6.png")),
                      SizedBox(width: 10),
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user7.png")),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
              TitleBar(title: "My Health Details"),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 59, 59),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
