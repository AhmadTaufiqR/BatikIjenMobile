import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/models/getArgumen.dart';
import 'package:http/http.dart' as http;

class register_page extends StatefulWidget {
  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  // ignore: non_constant_identifier_names
  var form_key = GlobalKey<FormState>();
  String? emailvalidate;
  bool isActivate = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  //TODO: Jika bisa tambahkan validasi jika email sudah atau pernah didaftarkan.

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    if (emailController != null) {
      emailController.addListener(
        () {
          final isActivate = emailController.text.isNotEmpty;
          setState(() => this.isActivate = isActivate);
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  checkEmail(String? email) async {
    Map data = {
      'email': email,
    };
    var url = Uri.parse("http://10.0.2.2/api/CheckingUser.php");
    var response = await http.post(url, body: data);
    final List<dynamic> datalog = json.decode(response.body);
    emailvalidate = datalog[0]["email"];
    // print(datalog[0]['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Text(
                  "Register Account",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Masukan Email/ No. Hp untuk mendaftar",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: const Color.fromRGBO(131, 133, 137, 100)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Email",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: Form(
                    key: form_key,
                    child: TextFormField(
                      validator: (value) => GetUtils.isEmail(value!)
                          ? null
                          : 'Silahkan Masukkan Kembali Email Anda',
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(246, 246, 246, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Masukkan Alamat Email Anda",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(196, 197, 196, 100),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      onChanged: (value) {
                        print(value);
                        checkEmail(value);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Username",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 100),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Masukkan Username Anda",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(196, 197, 196, 100),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
              ),
              SizedBox(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: const Color.fromRGBO(54, 105, 201, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isActivate
                      ? () {
                          setState(() {
                            isActivate = false;
                          });
                          if (form_key.currentState!.validate()) {
                            if (emailvalidate != null) {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                headerAnimationLoop: true,
                                dialogType: DialogType.error,
                                title: 'Salah',
                                desc: 'Email Yang Anda Masukkan Sudah Tersedia',
                                btnOkOnPress: () {
                                  emailvalidate = null;
                                },
                                onDismissCallback: (type) {
                                  debugPrint(
                                      'Dialog Dissmiss from callback $type');
                                },
                              ).show();
                            } else {
                              Get.toNamed("/profile",
                                  arguments: getargu(usernameController.text,
                                      emailController.text));
                            }
                          }
                        }
                      : null,
                  child: Text(
                    "Continue",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 82),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have An Account ? ',
                        style: GoogleFonts.dmSans(
                            color: const Color.fromRGBO(12, 26, 48, 100),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/login');
                          },
                        style: GoogleFonts.dmSans(
                            color: const Color.fromRGBO(54, 105, 201, 100),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
