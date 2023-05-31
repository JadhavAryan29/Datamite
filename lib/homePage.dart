import 'package:data_mites/LoginPage.dart';
import 'package:data_mites/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, _) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                user.email,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 62, 97),
                    fontSize: 22),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 80, left: 80),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 55,
                color: const Color.fromARGB(255, 12, 62, 97),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                // This is Form Validation Feild.
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textScaleFactor: 1,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
