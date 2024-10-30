import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/mycard.dart';
import 'AuthScreen.dart';
import 'homescreen2.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

TextEditingController textEditingController = TextEditingController();

void validate(BuildContext context) {
  if (textEditingController.text.toLowerCase() == "pagee") {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Welcome back"),
        ),
      );
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No internet connection"),
      ),
    );
  }
}

class _Homescreen1State extends State<Homescreen1> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final iconSize = isSmallScreen ? 28.0 : 35.0;
    final paddingSize = isSmallScreen ? 8.0 : 15.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: paddingSize),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.lab_flask_solid,
              size: iconSize,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bell,
                size: iconSize,
              )),
          Padding(
            padding: EdgeInsets.only(right: paddingSize, left: paddingSize / 2),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                CupertinoIcons.person,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: paddingSize),
        child: Column(
          children: [
            Image.asset(
              'assets/images/google-white-logo.png',
              height: screenSize.height * 0.08,
            ),
            SizedBox(height: paddingSize),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/lens.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(paddingSize),
                  fillColor: Colors.grey[900],
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontSize: isSmallScreen ? 18 : 22,
                      fontWeight: FontWeight.normal),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingSize),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          validate(context);
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        size: iconSize,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: paddingSize),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconContainer(
                      icon: Icons.image,
                      color: Color.fromARGB(103, 176, 159, 0),
                      iconColor: Color.fromARGB(255, 255, 232, 20),
                      iconSize: iconSize),
                  _buildIconContainer(
                      icon: Icons.translate,
                      color: Color.fromARGB(193, 17, 87, 144),
                      iconColor: Color.fromARGB(255, 145, 205, 255),
                      iconSize: iconSize),
                  _buildIconContainer(
                      icon: Icons.home_work,
                      color: Color.fromARGB(175, 61, 119, 63),
                      iconColor: Color.fromARGB(255, 0, 255, 132),
                      iconSize: iconSize),
                  _buildIconContainer(
                      icon: Icons.music_note,
                      color: Color.fromARGB(201, 183, 110, 0),
                      iconColor: Color.fromARGB(255, 255, 170, 95),
                      iconSize: iconSize),
                ],
              ),
            ),
            SizedBox(height: paddingSize),
            Divider(thickness: 0.2),
            SizedBox(height: paddingSize),
            const Mycard(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(
      {required IconData icon,
        required Color color,
        required Color iconColor,
        required double iconSize}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: color),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
