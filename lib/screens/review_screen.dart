import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shareex/provider/auth_provider.dart';
import 'package:shareex/utils/utils.dart';
import 'package:shareex/widgets/filled_dropdown.dart';
import 'package:shareex/widgets/rating_builder.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () => {},
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            backgroundImage:
                                NetworkImage(ap.userModel.profilePic),
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
                  const SizedBox(height: 40),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledDropdownMenu(
                          hintText: 'Category',
                          menuHeight: 100,
                          menuBackgroundColor: Color(0xFF8F6DCB),
                          buttonHeight: 40,
                          buttonBackgroundColor:
                              Color.fromARGB(255, 158, 121, 221),
                          menuWidth: 100,
                        ),
                        FilledDropdownMenu(
                          hintText: 'Category',
                          menuHeight: 100,
                          menuBackgroundColor: Color(0xFF8F6DCB),
                          buttonHeight: 40,
                          buttonBackgroundColor:
                              Color.fromARGB(255, 158, 121, 221),
                          menuWidth: 100,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 198, 177, 235),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your message",
                            filled: true,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        const SizedBox(height: 40),
                        Column(
                          children: [
                            Text(
                              "Customer Service",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7E57C2)),
                            ),
                            SizedBox(height: 10),
                            RatingBuilder()
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              "Pricing",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7E57C2)),
                            ),
                            SizedBox(height: 10),
                            RatingBuilder()
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              "Product Quality",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7E57C2)),
                            ),
                            SizedBox(height: 10),
                            RatingBuilder()
                          ],
                        ),
                        SizedBox(height: 20),
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
