// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/authenticate/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Sign up to Memoria",
              style: TextStyle(fontSize: 30),
            ),
            Form(
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
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 2) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          name = value!;
                        });
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
                      onSaved: (String? value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter phone Number',
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            // value.length != 10 ||
                            num.tryParse(value) == null) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          phoneNo = value!;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Please enter a valid password greater than 6 characters';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();

                                  String message = '';

                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                    print(credential);
                                    message = 'New account created';

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(message),
                                    ));
                                    dynamic db = FirebaseFirestore.instance;
                                    final user = <String, dynamic>{
                                      "name": name,
                                      "email": email,
                                      "phoneNo": phoneNo
                                    };
                                    DocumentReference doc =
                                        await db.collection('users').add(user);
                                    print("new document for user created");
                                    print(doc.id);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      message =
                                          'The password provided is too weak.';
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      message =
                                          'The account already exists for that email.';
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(message),
                                  ));
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text(
                                "Already have an account? LogIn",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue[400]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
