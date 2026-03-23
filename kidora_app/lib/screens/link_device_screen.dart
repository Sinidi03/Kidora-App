import 'package:flutter/material.dart';

class LinkDeviceScreen extends StatefulWidget {
  const LinkDeviceScreen({super.key});

  @override
  State<LinkDeviceScreen> createState() => _LinkDeviceScreenState();
}

class _LinkDeviceScreenState extends State<LinkDeviceScreen> {
  final TextEditingController _codeController = TextEditingController();

  static const Color kHeaderPurple = Color(0xFFD5B8EA);
  static const Color kButtonPurple = Color(0xFFAE77D7);
  static const Color kInputFill = Color(0xFFF3EAF9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 10),
            color: kHeaderPurple,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Link Device',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Enter code from parent\'s device',
                  style: TextStyle(color: kButtonPurple, fontSize: 14),
                ),
                const SizedBox(height: 30),

                // Interactive 6-Digit Input Field
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 12, // Spaces out the digits
                      color: kButtonPurple,
                    ),
                    decoration: InputDecoration(
                      counterText: "", // Hides the character counter
                      filled: true,
                      fillColor: kInputFill,
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Verify Button
                SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic to verify Req. 23
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}