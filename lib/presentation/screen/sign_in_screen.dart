import 'package:flutter/material.dart';
import 'package:tasksecond/presentation/utils/color_constants.dart';
import 'package:tasksecond/presentation/widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login-page.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Hi, User Login Here!!!",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Username",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Username: $username\nPassword: $password',
                        ),
                      ),
                    );
                  },
                  backgroundColor: CustomColors.primaryColor,
                  textColor: CustomColors.white,
                  borderColor: CustomColors.primaryColor,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the Row takes only as much space as needed
                    children: [
                      Text(
                        "Not registered yet? Click to ",
                        style: TextStyle(
                          color: CustomColors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " Register",
                        style: TextStyle(
                          color: CustomColors.secondPrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
