import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // We use the same brand color as the Login/Splash screen
    const Color brandColor = Color(0xFF4277BC);
    const Color lightBlueBg = Color(0xFFE3EDF7); // Approximate light blue for the card

    return Scaffold(
      backgroundColor: Colors.white,
      
      // 1. CUSTOM APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes the default shadow
        automaticallyImplyLeading: false, // Hides the back button
        
        // The Logo and Text on the left
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              "CODING ANARCHIST",
              style: TextStyle(
                fontFamily: 'RapidResponse', // Your custom font
                fontSize: 18,
                color: brandColor,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        
        // The Profile Icon on the right
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 32,
            ),
          ),
        ],
        
        // The grey line at the bottom of the AppBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),

      // 2. THE BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // --- GREETING SECTION ---
            Row(
              children: [
                const Icon(Icons.favorite, color: brandColor, size: 28),
                const SizedBox(width: 10),
                const Text(
                  "Halo, Kevin!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "Rajin Pangkal Kaya!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // --- STATUS CARD (Check In) ---
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFFA8C7FA), // Light blue background
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: brandColor, // Dark blue border
                  width: 4,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon: "Link Off" looks closest to your design
                  Transform.rotate(
                    angle: -0.5, // Tilted slightly
                    child: const Icon(
                      Icons.link_off,
                      size: 60,
                      color: brandColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "You are not checked in",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Check in before 09:00 am",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // --- MENU ITEMS ---
            
            // Item 1: Riwayat Kehadiran
            _buildMenuItem(
              icon: Icons.calendar_month,
              text: "Riwayat Kehadiran",
              color: Colors.blueAccent,
            ),

            const SizedBox(height: 20),

            // Item 2: Slip Gaji
            _buildMenuItem(
              icon: Icons.wallet,
              text: "Slip Gaji",
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to create the menu items cleanly
  Widget _buildMenuItem({required IconData icon, required String text, required Color color}) {
    return Row(
      children: [
        // The Icon Box
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2), // Light background for icon
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 15),
        
        // The Text
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        
        // The Arrow
        const Icon(Icons.arrow_forward, color: Colors.black),
      ],
    );
  }
}