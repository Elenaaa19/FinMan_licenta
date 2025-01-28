import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen({Key? key, this.user}) : super(key: key);

  // Function to create a Plaid Link token
  Future<String?> createLinkToken() async {
    final url = Uri.parse("https://sandbox.plaid.com/link/token/create");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "client_id": dotenv.env['CLIENT_ID'],
        "secret": dotenv.env['SECRET'],
        "client_name": "FinMan App",
        "products": ["auth", "transactions"],
        "country_codes": ["US"],
        "language": "en",
        "user": {"client_user_id": "user-id-12345"}, // Replace with unique user ID
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Link Token: ${data['link_token']}");
      return data['link_token'];
    } else {
      print("Failed to create link token: ${response.body}");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome message
            Text(
              'Welcome, ${user?.email ?? 'User'}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'You are now logged in.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),

            // Button to generate Plaid Link token
            ElevatedButton(
              onPressed: () async {
                final linkToken = await createLinkToken();
                if (linkToken != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Link Token Generated: $linkToken')),
                  );
                }
              },
              child: Text("Generate Link Token"),
            ),
          ],
        ),
      ),
    );
  }
}
