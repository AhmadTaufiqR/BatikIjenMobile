import 'package:shared_preferences/shared_preferences.dart';

class shared {
  setIntoSharedPreferences(String? id, String? username, String? password,
      String? namalengkap, String? email, String? telepon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id", id!);
    await prefs.setString("username", username!);
    await prefs.setString("password", password!);
    await prefs.setString("namalengkap", namalengkap!);
    await prefs.setString("email", email!);
    await prefs.setString("telepon", telepon!);
  }

  // getShared() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final user = prefs.getString("username");
  //   final pass = prefs.getString("password");
  //   final img = prefs.getString("gambar");
  //   final nama = prefs.getString("namalengkap");
  //   final mail = prefs.getString("email");
  //   final telp = prefs.getString("telepon");
  //   final dress = prefs.getString("alamat");
  //   final age = prefs.getString("umur");
  //   final job = prefs.getString("pekerjaan");
  //   return {
  //     user.toString(),
  //     pass.toString(),
  //     img.toString(),
  //     nama.toString(),
  //     mail.toString(),
  //     dress.toString(),
  //     age.toString(),
  //     job.toString(),
  //     telp.toString()
  //   };
  // }
}
