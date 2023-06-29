import 'package:flutter/material.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Smart Intruder Alert System')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Center(
              child: Image(
                image: AssetImage('asserts/cloud.png'),
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Connect Here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
            const Text('Hi there! Nice to see you again.'),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: idController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent)),
                      prefixIcon: const Icon(Icons.contacts),
                      hintText: 'Enter User ID',
                      labelText: 'User ID',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: pwController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent)),
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (idController.text == 'admin') {
                          if (pwController.text == '1234') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(user: idController.text),
                              ),
                            );
                          }
                          else {
                            const Text('Please re Enter');
                          }
                        }
                      },
                      child: const Text('Connect'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

