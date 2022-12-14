import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetxSnippet extends GetxController {
  Future allproduct() async {
    var url = Uri.parse("http://10.0.2.2/api/baru/viewall.php");
    var response = await http.get(url);
    return json.decode(response.body);
  }

  signIn(String username, String pass, dynamic context) async {
    Map data = {
      'username': username,
      'password': pass,
    };
    var respons =
        await http.post(Uri.parse("http://10.0.2.2/api/login.php"), body: data);
    var uji = jsonEncode(jsonDecode(respons.body));
    final Map<String, dynamic> datalog = json.decode(respons.body);
    var nametag = datalog['user_list'][0]['nama_lengkap'];
    // print(respons.body);
    if (uji.contains('Sukses')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Anda Berhasil Login',
        btnOkOnPress: () {
          Get.toNamed('/myScreen', arguments: nametag);
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('Username_salah')) {
      Get.snackbar("Error", "Username Yang Anda Masukkan Salah",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else if (uji.contains('Password_salah')) {
      Get.snackbar("Error", "Password Yang Anda Masukkan Salah",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  // ignore: non_constant_identifier_names
  SignUp(String user, pass, email, full, telepon) async {
    Map data = {
      'username': user,
      'password': pass,
      'email': email,
      'nama_lengkap': full,
      'telepon': telepon,
    };

    var respons = await http.post(Uri.parse('http://10.0.2.2/api/register.php'),
        body: data);
    var uji = jsonEncode(jsonDecode(respons.body));

    if (uji.contains('USER_REGISTERED')) {
      Get.snackbar("Success", "Register Berhasil",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      Get.toNamed('/login');
    } else if (uji.contains('EMAIL_ALREADY')) {
      Get.snackbar("Error",
          "Email Telah Terdaftar, Silahkan Masukkan Kembali Email Anda",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else if (uji.contains('REGISTER_ERROR')) {
      Get.snackbar("Error", "Silahkan Isi Kembali Data Anda",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }
}
