import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GetxSnippet snip = GetxSnippet();
  TextEditingController? name = TextEditingController();
  TextEditingController? addres = TextEditingController();
  TextEditingController? no = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? pekerjaan = TextEditingController();
  // TextEditingController? gambar = TextEditingController();
  TextEditingController? umur = TextEditingController();
  String? id;

  File? profileImage;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(image!.path);
    // File? img = File(image!.path);
    // print(img);
    // img = await cropimage(imageFile: File(image.path));
    // setState(() {
    //   profileImage = img;
    // });
  }

  Future<File?> cropimage({required File imageFile}) async {
    CroppedFile? cropped =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (cropped == null) return null;
    return File(cropped.path);
  }

  @override
  void initState() {
    _getData();
    // print(profileImage);
    // print(nama);
    super.initState();
  }

  void _getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(
      () {
        // Mengambil data dengan kunci "data_3"
        id = sharedPreferences.getString('id').toString();
        name!.text = sharedPreferences.getString('namalengkap').toString();
        // addres!.text = sharedPreferences.getString('alamat').toString();
        no!.text = sharedPreferences.getString('telepon').toString();
        email!.text = sharedPreferences.getString('email').toString();
        // pekerjaan!.text = sharedPreferences.getString('pekerjaan').toString();
        // gambar!.text = sharedPreferences.getString('gambar').toString();
        // umur!.text = sharedPreferences.getString('umur').toString();
        print(id);
        print(name!.text);
        print(addres!.text);
        print(no!.text);
        print(email!.text);
        print(pekerjaan!.text);
        print(profileImage.toString());
        print(umur!.text);

        // print(sharedPreferences.getString('username'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            expandedHeight: 60,
            snap: true,
            titleSpacing: 165,
            title: Text(
              "Profile",
              style: GoogleFonts.dmSans(
                color: Colors.black,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: profileImage == null
                            ? const AssetImage("assets/logo/imageprofile.png")
                            : FileImage(profileImage!) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: name,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: no,
                  maxLength: 13,
                  decoration: const InputDecoration(
                    labelText: 'No Telepon',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Your number phone?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your email?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: pekerjaan,
                  decoration: const InputDecoration(
                    labelText: 'Pekerjaan',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your job?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: umur,
                  maxLength: 3,
                  decoration: const InputDecoration(
                    labelText: 'Usia',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your age",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Address",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: addres,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Alamat",
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      snip.updatepro(id.toString(), profileImage.toString(),
                          pekerjaan!.text, umur!.text, addres!.text, context);
                      // print(profileImage.toString());
                    });
                  },
                  child: const Text("Update Profile"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      backgroundColor: Colors.red[100]),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove("username");
                    prefs.remove("password");
                    prefs.remove("gambar");
                    prefs.remove("namalengkap");
                    prefs.remove("email");
                    prefs.remove("telepon");
                    prefs.remove("alamat");
                    prefs.remove("umur");
                    prefs.remove("pekerjaan");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const login(),
                        ));
                  },
                  child: const Text("Logout"),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
