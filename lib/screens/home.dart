import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCheckIn = false;
  List<String> images = [
    "https://miro.medium.com/v2/resize:fit:525/0*rwPF-cLzQQkOijjk.jpeg",
    "https://images.shiksha.com/mediadata/images/1533193080phpkt4YnF.png",
    "https://itmuniversity.ac.in/wp-content/uploads/2019/05/DSC_7329.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          height: 30,
          child: Image.asset('assets/images/itm.png'),
        ),
        title: const Text(
          "Vikalp Paliwal",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Lora',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              margin: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(image, fit: BoxFit.cover),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
                height:
                    20), // Add some spacing between the slider and the button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isCheckIn ? Colors.red : Colors.green),
                onPressed: () {
                  setState(() {
                    isCheckIn = !isCheckIn;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(isCheckIn ? "Check-Out" : "Check-In",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/profile.jpg"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: const Text(
                            "Events",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Lora",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: Center(
                          child: Text(
                        "No Events Today",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
