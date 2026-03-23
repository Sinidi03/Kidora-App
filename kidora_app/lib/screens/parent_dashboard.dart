import 'package:flutter/material.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  // Theme colors from your KIDORA palette
  static const Color kHeaderPurple = Color(0xFFD5B8EA);
  static const Color kLightPurple = Color(0xFFF3EAF9);
  static const Color kDeepPurple = Color(0xFF846CAC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. Implementation of the Hidden Side Menu (Drawer)
      drawer: Drawer(
        width: 120, // Narrow width to match your "Add Child" sidebar design
        backgroundColor: kLightPurple,
        child: Column(
          children: [
            const SizedBox(height: 60),
            _buildProfileAvatar("Alex", Colors.orangeAccent),
            const SizedBox(height: 20),
            _buildProfileAvatar("Emma", Colors.brown),
            const SizedBox(height: 30),
            const Divider(indent: 20, endIndent: 20),
            const SizedBox(height: 10),
            const Icon(Icons.add, size: 40, color: Colors.black),
            const Text(
              "Add Child", 
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kDeepPurple)
            ),
          ],
        ),
      ),
      body: Builder( // Used to open the drawer from a custom button
        builder: (context) {
          return Column(
            children: [
              // 2. Header with Hamburger Menu Click Action
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 20, left: 10),
                color: kHeaderPurple,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, size: 30),
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // Opens side menu on click
                      },
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Active Profile Card (Matches wireframe image_3f17ad.png)
                      _buildActiveChildCard("Kyle"),
                      const SizedBox(height: 25),

                      // Functional Grid (Screen Time, App Block, etc.)
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        children: [
                          _buildGridCard("Screen Time", "2h 25m today", Icons.phone_android, kHeaderPurple),
                          _buildGridCard("App Block", "", Icons.lock_clock, kLightPurple),
                          _buildGridCard("Send reminders", "", Icons.alarm, kLightPurple),
                          _buildGridCard("Restrictions", "", Icons.speaker_notes, kHeaderPurple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Bottom Utility Bar (Settings & Notifications)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                color: kLightPurple.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.settings, color: Colors.black),
                    Stack(
                      children: [
                        const Icon(Icons.notifications_none, size: 30),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  // Helper Widgets
  Widget _buildProfileAvatar(String name, Color color) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundColor: color.withOpacity(0.3), child: const Icon(Icons.face, size: 40)),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: kDeepPurple)),
      ],
    );
  }

  Widget _buildActiveChildCard(String name) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: kLightPurple, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          const CircleAvatar(radius: 30, backgroundColor: Colors.orangeAccent),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kDeepPurple)),
              const Text("Active", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard(String title, String subtitle, IconData icon, Color bgColor) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: kDeepPurple, fontSize: 13)),
          const SizedBox(height: 10),
          Icon(icon, size: 40, color: kDeepPurple),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(subtitle, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
          ]
        ],
      ),
    );
  }
}