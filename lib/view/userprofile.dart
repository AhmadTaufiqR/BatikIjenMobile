import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/models/getArgumen.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/login_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  GetxSnippet snip = GetxSnippet();
  bool _isObscure = true;
  TextEditingController passwordC = TextEditingController();
  TextEditingController fullnameC = TextEditingController();
  TextEditingController teleponC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as getargu;
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
                  "Profile & Password",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lengkapi data terakhir berikut untuk masuk ke aplikasi Sanggar Batik",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(131, 133, 137, 100)),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Full Name",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: fullnameC,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(246, 246, 246, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Masukkan Nama Lengkap Anda",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(196, 197, 196, 100))),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Password",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: passwordC,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 100),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Masukkan Kata Sandi Akun",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(196, 197, 196, 100),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          size: 20,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 15,
                    color: Color.fromRGBO(131, 133, 137, 100),
                  ),
                  Text(
                    " Kata Sandi Harus Lebih Dari 6 Karakter",
                    style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Color.fromRGBO(131, 133, 137, 100)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "No Telephone",
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    maxLength: 13,
                    controller: teleponC,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(246, 246, 246, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Masukkan No Telephone Anda",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(196, 197, 196, 100))),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onSurface: Color.fromRGBO(54, 105, 201, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    snip.SignUp(args.text1!, passwordC.text, args.text2!,
                        fullnameC.text, teleponC.text);
                  },
                  child: Text(
                    "Continue",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
