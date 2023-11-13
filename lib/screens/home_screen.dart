import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareex/provider/auth_provider.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        backgroundImage: NetworkImage(ap.userModel.profilePic),
                      ),
                      Text(ap.userModel.name),
                      Text(ap.userModel.homeTown)
                    ],
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
