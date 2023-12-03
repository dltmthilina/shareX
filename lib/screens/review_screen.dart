import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shareex/model/review_model.dart';
import 'package:shareex/provider/auth_provider.dart';
import 'package:shareex/screens/home_screen.dart';
import 'package:shareex/utils/utils.dart';
import 'package:shareex/widgets/custom_button.dart';
import 'package:shareex/widgets/filled_dropdown.dart';
import 'package:shareex/widgets/rating_builder.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController descriptionController = TextEditingController();
  late String? serviceCenterName;
  late String? serviceCategory;
  late double customerService;
  late double pricing;
  late double productQuality;

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
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pop(context),
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
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
                              NetworkImage(ap.userModel.profilePic ?? ''),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          capitalizeAllWord(ap.userModel.name),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
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
                const SizedBox(height: 70),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FilledDropdownMenu(
                          list: const [
                            "Stationary",
                            "Hardware",
                            "Medical",
                            "Sparepart",
                            "Retail",
                            "Whole sale",
                            "Skilled Service"
                          ],
                          hintText: 'Category',
                          menuHeight: 100,
                          menuBackgroundColor: Color(0xFF8F6DCB),
                          buttonHeight: 40,
                          buttonBackgroundColor:
                              const Color.fromARGB(255, 158, 121, 221),
                          menuWidth: 100,
                          onValueChanged: (String? value) {
                            serviceCategory = value;
                            print(serviceCategory);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: FilledDropdownMenu(
                          list: const ["Sihina Bookshop", "Iresh Pharmacy"],
                          hintText: 'Name',
                          menuHeight: 100,
                          menuBackgroundColor: const Color(0xFF8F6DCB),
                          buttonHeight: 40,
                          buttonBackgroundColor:
                              const Color.fromARGB(255, 158, 121, 221),
                          menuWidth: 100,
                          onValueChanged: (String? value) {
                            serviceCenterName = value;
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 198, 177, 235),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(blurRadius: 5),
                          ],
                        ),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          children: [
                            TextField(
                              controller: descriptionController,
                              decoration: const InputDecoration(
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
                                const Text(
                                  "Customer Service",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7E57C2)),
                                ),
                                const SizedBox(height: 10),
                                RatingBuilder(
                                  onRatingChanged: (rating) {
                                    customerService = rating;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                const Text(
                                  "Pricing",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7E57C2)),
                                ),
                                const SizedBox(height: 10),
                                RatingBuilder(
                                  onRatingChanged: (rating) {
                                    pricing = rating;
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                const Text(
                                  "Product Quality",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7E57C2)),
                                ),
                                const SizedBox(height: 10),
                                RatingBuilder(
                                  onRatingChanged: (rating) {
                                    productQuality = rating;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                            text: "Save",
                            onPressed: () {
                              storeReview();
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void storeReview() async {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    final ap = Provider.of<AuthProvider>(context, listen: false);

    ReviewModel reviewModel = ReviewModel(
      homeTown: '',
      category: serviceCategory,
      center: serviceCenterName,
      description: descriptionController.text,
      custService: customerService,
      pricing: pricing,
      pQuality: productQuality,
      uid: ap.uid,
    );

    try {
      await _firebaseFirestore
          .collection("reviews")
          .doc(serviceCenterName)
          .set(reviewModel.toMap())
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      });
    } on Exception catch (_) {}
  }
}
