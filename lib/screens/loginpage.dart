import 'package:attendence/screens/myhomepage.dart';
import 'package:attendence/utils/colors.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Center(
                child: Text(
                  "Attendence",
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'Lora'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: const Text(
                "Hey\nLogin Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lora",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Don't have any Account? ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Lora",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldController("Username", _usernameController),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldController("Password", _passwordController),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white, fontFamily: "Lora"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Login as Admin",
                    style: TextStyle(color: Colors.white, fontFamily: "Lora"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(155, 255, 4, 226)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Myhomepage(),
                      ));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontFamily: "Lora"),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(child: Image.asset("assets/images/bgimage.png")),
            )
          ],
        ),
      ),
    );
  }

  Container CustomTextFieldController(
      String hint, TextEditingController controller) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor:
              _usernameController.text.isEmpty ? Colors.white : Colors.white54,
          hintText: hint,
        ),
      ),
    );
  }
}
