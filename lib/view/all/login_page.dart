import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/all/dash.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isActivate = false;
  TextEditingController? passwordController;
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();
    emailController = TextEditingController();
    if (emailController != null) {
      passwordController!.addListener(
        () {
          final isActivate = passwordController!.text.isNotEmpty;
          setState(() => this.isActivate = isActivate);
        },
      );
    }
  }

  @override
  void dispose() {
    passwordController!.dispose();
    super.dispose();
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
                  "Welcome Back To \nSanggar Batik",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Silahkan masukkan data untuk login",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(131, 133, 137, 100)),
              ),
              SizedBox(
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
                padding: EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 45,
                  child: TextField(
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
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
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onSurface: Color.fromRGBO(54, 105, 201, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: isActivate
                      ? () {
                          setState(() => isActivate = false);
                          passwordController!.clear();
                        }
                      : null,
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => Dashboard()));
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: GoogleFonts.dmSans(
                          color: Color.fromRGBO(12, 26, 48, 100),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.43,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => Dashboard()));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.dmSans(
                          color: Color.fromRGBO(54, 105, 201, 100),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
