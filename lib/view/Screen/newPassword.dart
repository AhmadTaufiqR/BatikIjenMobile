import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';

class newPass extends StatefulWidget {
  const newPass({super.key});

  @override
  State<newPass> createState() => _newPassState();
}

class _newPassState extends State<newPass> {
  bool _isObscure = true;
  bool isObscure = true;
  bool isActivate = false;
  TextEditingController? passwordController;
  TextEditingController? newpassController;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();
    newpassController = TextEditingController();
    if (newpassController != null) {
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
                  "Update Password",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lengkapi data terakhir berikut untuk masuk ke aplikasi Sanggar Batik",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: const Color.fromRGBO(131, 133, 137, 100)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "New Password",
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
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(246, 246, 246, 100),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Masukkan Kata Sandi Akun",
                      hintStyle: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 15,
                    color: Color.fromRGBO(131, 133, 137, 100),
                  ),
                  Text(
                    " Kata Sandi Harus 6 Karakter Atau Lebih",
                    style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: const Color.fromRGBO(131, 133, 137, 100)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Confirm New Password",
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
                    controller: newpassController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(246, 246, 246, 100),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Masukkan Kata Sandi Akun",
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(196, 197, 196, 100),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          size: 20,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onSurface: const Color.fromRGBO(54, 105, 201, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: isActivate
                      ? () {
                          setState(() => isActivate = false);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const login()),
                          );
                        }
                      : null,
                  child: Text(
                    "Save Password",
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
