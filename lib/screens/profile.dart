import 'package:attendence/screens/geofencing.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.asset("assets/images/profile.jpg"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Vikalp Paliwal",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lora",
                  fontSize: 25,
                ),
              ),
              SettingsCOntainer(
                "Edit Profile",
                "Contact Details, Personal Details, etc..",
                const Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
              ),
              SettingsCOntainer(
                "Bank Details",
                "Account Number, Upi Id, etc..",
                const Icon(
                  Icons.account_balance,
                  color: Colors.amber,
                ),
              ),
              SettingsCOntainer(
                "Theme",
                "System Depend Dark theme or Light theme",
                const Icon(
                  Icons.color_lens,
                  color: Colors.amber,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeoFencing(),
                      ));
                },
                child: SettingsCOntainer(
                    "GeoFencing",
                    "Edit or add geofencing",
                    const Icon(
                      Icons.location_city,
                      color: Colors.amber,
                    )),
              ),
              SettingsCOntainer(
                "Language",
                "Contact Details, Personal Details, etc..",
                const Icon(
                  Icons.language,
                  color: Colors.amber,
                ),
              ),
              SettingsCOntainer(
                "Feedback",
                "Contact Details, Personal Details, etc..",
                const Icon(
                  Icons.feed,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container SettingsCOntainer(String title, String subTitle, Icon icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontFamily: "Lora"),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
