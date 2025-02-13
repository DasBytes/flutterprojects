import 'package:flutter/material.dart';

class ProfileInsertScreen extends StatefulWidget {
  @override
  _ProfileInsertScreenState createState() => _ProfileInsertScreenState();
}

class _ProfileInsertScreenState extends State<ProfileInsertScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Insert Profile Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: "Bio"),
            ),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(labelText: "Gender"),
            ),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(labelText: "Date of Birth"),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: hobbiesController,
              decoration: const InputDecoration(labelText: "Hobbies"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a map with the entered profile details
                Map<String, String> profileData = {
                  'fullName': fullNameController.text,
                  'username': usernameController.text,
                  'bio': bioController.text,
                  'gender': genderController.text,
                  'dob': dobController.text,
                  'address': addressController.text,
                  'hobbies': hobbiesController.text,
                };

                // Return profile data to the HomeScreen
                Navigator.pop(context, profileData);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
