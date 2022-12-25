import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/Screen/newPassword.dart';

class resetPass extends StatefulWidget {
  @override
  State<resetPass> createState() => _resetPassState();
}

class _resetPassState extends State<resetPass> {
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const newPass(),
                            ),
                          );
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
