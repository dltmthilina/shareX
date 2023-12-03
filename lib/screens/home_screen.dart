import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareex/provider/auth_provider.dart';
import 'package:shareex/screens/review_screen.dart';
import 'package:shareex/utils/utils.dart';
import 'package:shareex/widgets/custom_button.dart';
import 'package:shareex/widgets/review_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_image.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => {},
                          child: const Icon(
                            Icons.menu_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          child: const Text("Logout"),
                          onPressed: () => logout(context),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            backgroundImage:
                                // ignore: prefer_if_null_operators
                                NetworkImage(ap.userModel.profilePic ?? ''),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            capitalizeAllWord(ap.userModel.name),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Text(
                        capitalizeAllWord(ap.userModel.homeTown),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      text: "Create Review",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewScreen(),
                          ),
                        );
                      }),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        ReviewBuilder(),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
