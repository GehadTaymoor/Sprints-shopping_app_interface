import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/main_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isObscure = true;
  bool isObscureConfirmation = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Account created successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        MainScreen(), // Navigate to shopping screen
                  ),
                );
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fix the errors in the form.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void togglePassword() {
    isObscure = !isObscure;
    setState(() {});
  }

  void togglePasswordConfirmation() {
    isObscureConfirmation = !isObscureConfirmation;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full name is required';
                  } else if (value[0] != value[0].toUpperCase()) {
                    return 'First letter must be capitalized';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!value.contains('@')) {
                    return 'Email must contain @';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePassword();
                        },
                        icon: Icon(isObscure
                            ? Icons.remove_red_eye
                            : Icons.visibility_off))),
                obscureText: isObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          togglePasswordConfirmation();
                        },
                        icon: Icon(isObscureConfirmation
                            ? Icons.remove_red_eye
                            : Icons.visibility_off))),
                obscureText: isObscureConfirmation,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Sign Up',
                    style: TextStyle(fontSize: screenWidth * 0.045)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
