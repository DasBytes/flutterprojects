import 'package:flutter/material.dart';
import 'ProfileInsertScreen.dart'; // Import the new screen

import 'custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.mobileNumber,
    required this.password,
  }) : super(key: key);
  final String mobileNumber, password;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = '', username = '', bio = '', gender = '', dob = '', address = '', hobbies = '';

  // Function to update the profile data after returning from the insert page
  void updateProfileData(Map<String, String> profileData) {
    setState(() {
      fullName = profileData['fullName'] ?? '';
      username = profileData['username'] ?? '';
      bio = profileData['bio'] ?? '';
      gender = profileData['gender'] ?? '';
      dob = profileData['dob'] ?? '';
      address = profileData['address'] ?? '';
      hobbies = profileData['hobbies'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(
          mobileNumber: widget.mobileNumber,
          password: widget.password,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Navigate to Profile Insert Screen
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileInsertScreen(),
                    ),
                  );

                  // If the user saved profile data, update the UI
                  if (result != null && result is Map<String, String>) {
                    updateProfileData(result);
                  }
                },
                child: const Text("Insert Profile Details"),
              ),
              const SizedBox(height: 20),

              // Display saved profile details
              Text("Full Name: $fullName"),
              Text("Username: $username"),
              Text("Bio: $bio"),
              Text("Gender: $gender"),
              Text("Date of Birth: $dob"),
              Text("Address: $address"),
              Text("Hobbies: $hobbies"),
            ],
          ),
        ),
      ),
    );
  }
}
