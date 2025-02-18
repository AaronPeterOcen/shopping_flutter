import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: const Text(
                      "KW", // Initials
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Kristin Watson",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const Divider(),

            // My Orders
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text("My Orders"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            const Divider(),

            // SETTINGS HEADER
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "SETTINGS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            // User Profile
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("User Profile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to User Profile Page
              },
            ),

            // Push Notifications
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Allow push notifications"),
              subtitle: const Text(
                  "Get updates on your sales, purchases, and key activities."),
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  // Update the state
                },
              ),
            ),

            // Payment Methods
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Payment methods"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Payment Methods Page
              },
            ),

            // Delivery Address
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Delivery address"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            const Divider(),

            // HELP HEADER
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "HELP",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            // FAQ
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text("FAQ"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            // Support
            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text("Support"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            const Divider(),

            // Logout Button
            TextButton(
              onPressed: () {},
              child: const Text(
                "Log out",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Footer Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 14, color: Colors.teal),
                  ),
                ),
                const Text("|",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 14, color: Colors.teal),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
