import 'package:flutter/material.dart';
import 'package:admin/navbar_roots.dart';
import 'login_page.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBarRoots(),
                      ));
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 125, 255),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            const SizedBox(height: 50),
            const Text(
              'pharmaX admin',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 125, 255),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'easy and full access.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: const Color.fromARGB(255, 4, 125, 255),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpage(),
                          ));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
