import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  String phoneNo = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Name',
              ),
              onChanged: (String val) {
                setState(() {
                  name = val;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please enter a valid name';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ),
              validator: (String? value) {
                String pattern =
                    r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
                RegExp emailRegex = RegExp(pattern);
                if (value == null ||
                    value.isEmpty ||
                    !emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter phone Number',
              ),
              validator: (String? value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length != 10 ||
                    num.tryParse(value) == null) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter password',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please enter a valid password greater than 6 characters';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                  // Navigator.push(context, '/home');
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
