import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(
                Icons.home_rounded,
                size: 80,
                color: Colors.blue
              ),
              const Text(
                'KosanHub',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email atau Nomor HP',
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor:Colors.white,
                ),
              ),
              const SizedBox(height: 300),
              ElevatedButton(
                onPressed: (){}, 
                child: const Text('Login'))
            ],
          )
        ),
      ),
    );
  }
}