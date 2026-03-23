import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'link_device_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFD5B8EA),
      body: Column(
        children: [
          const Spacer(flex: 2),
          Center(child: Image.asset('assets/kidora_logo.jpeg', width: 150)),
          const SizedBox(height: 10),
          const Text('Smart Parenting Starts Here'), 
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _buildRoundedButton(context, "Log in", const Color(0xFFAE77D7)),
                const SizedBox(height: 15),
                _buildRoundedButton(context, "Sign up", const Color(0xFFAE77D7)),
                const SizedBox(height: 15),
                _buildRoundedButton(context, "Link Device", const Color(0xFFAE77D7)),
              ],
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 2,
        ),
        onPressed: () {
          if (text == "Log in") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else if (text == "Sign up") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          } else if (text == "Link Device") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LinkDeviceScreen()),
            );
          }
        },
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}