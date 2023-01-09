import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/Screen/newPassword.dart';
import 'package:http/http.dart' as http;

class resetPass extends StatefulWidget {
  @override
  State<resetPass> createState() => _resetPassState();
}

class _resetPassState extends State<resetPass> {
  var form_key = GlobalKey<FormState>();
  String? emailValidate;
  bool isActivate = false;
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    emailController = TextEditingController();
    if (emailController != null) {
      emailController!.addListener(
        () {
          final isActivate = emailController!.text.isNotEmpty;
          setState(() => this.isActivate = isActivate);
        },
      );
    }
  }

  @override
  void dispose() {
    emailController!.dispose();
    super.dispose();
  }

  checkEmail(String? email) async {
    Map data = {
      'email': email,
    };
    var url =
        Uri.parse("https://sanggar-batik.wstif3a-bws.id/api/CheckingUser.php");
    var response = await http.post(url, body: data);
    final List<dynamic> datalog = jsonDecode(response.body);
    emailValidate = datalog[0]["email"];
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
                  "RESET PASSWORD",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Masukan Email/ No. Hp akun untuk mereset\nkata sandi Anda ",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: const Color.fromRGBO(131, 133, 137, 100)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Email/ Phone",
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
                        hintText: "Masukkan Alamat Email/ No Telepon Anda",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(196, 197, 196, 100),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      onChanged: (value) => checkEmail(value),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
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
                          setState(() => isActivate = false);

                          if (form_key.currentState!.validate()) {
                            if (emailValidate != emailController!.text) {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                headerAnimationLoop: true,
                                dialogType: DialogType.error,
                                title: 'Salah',
                                desc: 'Email Yang Anda Masukkan Sudah Tersedia',
                                btnOkOnPress: () {
                                  emailValidate = null;
                                },
                                onDismissCallback: (type) {
                                  debugPrint(
                                      'Dialog Dissmiss from callback $type');
                                },
                              ).show();
                            } else if (emailController!.text == emailValidate) {
                              Get.to(newPass(),
                                  arguments: emailController!.text);
                              emailValidate = null;
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
