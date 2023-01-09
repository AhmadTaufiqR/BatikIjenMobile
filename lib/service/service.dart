import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ijen_batik/models/argumencatgory.dart';
import 'package:ijen_batik/models/argumentsSearch.dart';
import 'package:ijen_batik/service/sharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class GetxSnippet extends GetxController {
  String? nama;
  Future allproduct() async {
    var url =
        Uri.parse("https://sanggar-batik.wstif3a-bws.id/api/baru/viewall.php");
    var response = await http.get(url);
    return json.decode(response.body);
  }

  signIn(String username, String pass, dynamic context) async {
    shared sh = shared();
    Map data = {
      'username': username,
      'password': pass,
    };
    var respons = await http.post(
        Uri.parse("https://sanggar-batik.wstif3a-bws.id/api/login.php"),
        body: data);
    var uji = jsonEncode(jsonDecode(respons.body));
    final Map<String, dynamic> datalog = json.decode(respons.body);

    // print(respons.body);
    if (uji.contains('Sukses')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Anda Berhasil Login',
        btnOkOnPress: () {
          var id = datalog['user_list'][0]['id'];
          var username = datalog['user_list'][0]['username'];
          var telepon = datalog['user_list'][0]['telepon'];
          var nama = datalog['user_list'][0]['nama'];
          var password = datalog['user_list'][0]['password'];
          var email = datalog['user_list'][0]['email'];
          Get.toNamed('/myScreen', arguments: nama);
          sh.setIntoSharedPreferences(
              id, username, password, nama, email, telepon);
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('Username_salah')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.warning,
        title: 'Warning',
        desc: 'Username Yang Anda Masukkan Salah',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('Password_salah')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.warning,
        title: 'Warning',
        desc: 'Password Yang Anda Masukkan Salah',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
  }

  // ignore: non_constant_identifier_names
  SignUp(String user, pass, email, full, telepon, dynamic context) async {
    Map data = {
      'username': user,
      'password': pass,
      'email': email,
      'nama_lengkap': full,
      'telepon': telepon,
    };

    var respons = await http.post(
        Uri.parse('https://sanggar-batik.wstif3a-bws.id/api/register.php'),
        body: data);
    var uji = jsonEncode(jsonDecode(respons.body));

    if (uji.contains('USER_REGISTERED')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Anda Berhasil Mendaftar',
        btnOkOnPress: () {
          Get.toNamed('/login');
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('EMAIL_ALREADY')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.warning,
        title: 'Warning',
        desc: 'Email Sudah Terdaftar, Silahkan Masukkan Email Anda Kembali',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('REGISTER_ERROR')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.warning,
        title: 'Warning',
        desc: 'Silahkan Masukkan Kembali, Data Anda',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
  }

  resetPassword(String pass, email, dynamic context) async {
    Map data = {
      'pass': pass,
      'email': email,
    };

    var respons = await http.post(
        Uri.parse('https://sanggar-batik.wstif3a-bws.id/api/editpass.php'),
        body: data);

    // print(jsonDecode(respons.body));
    var uji = jsonEncode(respons.body);

    if (uji.contains('true')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Anda Berhasil Mendaftar',
        btnOkOnPress: () {
          Get.toNamed('/login');
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('false')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.warning,
        title: 'Warning',
        desc: 'Ada Kesaahan, Silahkan Masukkan Kembali Password Anda',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
  }

  Future categori(String? jenis) async {
    Map data = {
      'title': jenis,
    };
    var url = Uri.parse(
        "https://sanggar-batik.wstif3a-bws.id/api/baru/viewall_category.php");
    var response = await http.post(url, body: data);
    final List<dynamic> datalog = json.decode(response.body);
    Get.toNamed('/listcategory', arguments: argumentcategory(jenis, datalog));
  }

  Future searchpage(String? search) async {
    Map data = {
      'cari': search,
    };
    var url =
        Uri.parse("https://sanggar-batik.wstif3a-bws.id/api/CariProduct.php");
    var response = await http.post(url, body: data);
    final List<dynamic> datalog = json.decode(response.body);
    print(datalog);
    Get.toNamed('/listsearch', arguments: argumentsSearch(datalog));
  }

  updatepro(String? id, String? gambar, String? pekerjaan, String? umur,
      String? alamat, dynamic context) async {
    Map data = {
      'id_pengguna': id,
      'pekerjaan': pekerjaan,
      'umur': umur,
      'alamat': alamat,
      'path_gambar': gambar,
    };

    var respons = await http.post(
        Uri.parse('https://sanggar-batik.wstif3a-bws.id/api/updateprof.php'),
        body: data);

    // print(jsonDecode(respons.body));
    var uji = jsonEncode(jsonDecode(respons.body));

    if (uji.contains('true')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Update Berhasil',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('false')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.error,
        title: 'error',
        desc: 'Silahkan Isikan Kembali',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
  }

  addshop(String? total, String? jumlah, String? sub, dynamic context) async {
    Map data = {
      'total': total,
      'jumlah': jumlah,
      'sub': sub,
    };

    var respons = await http.post(
        Uri.parse('https://sanggar-batik.wstif3a-bws.id/api/order.php'),
        body: data);

    // print(jsonDecode(respons.body));
    var uji = jsonEncode(jsonDecode(respons.body));
    print(uji);

    if (uji.contains('true')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.success,
        title: 'Succes',
        desc: 'Update Berhasil',
        btnOkOnPress: () {
          openwhat();
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else if (uji.contains('false')) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        dialogType: DialogType.error,
        title: 'error',
        desc: 'Silahkan Isikan Kembali',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }

  void getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    nama = sharedPreferences.getString('namalengkap').toString();
  }

  openwhat() async {
    getdata();
    var whats = "082142151597";
    var whatsURL_android = "whatsapp://send?phone=" +
        whats +
        "&text=${greeting()} Saya ingin memesan product anda, dengan beratas namakan ${nama}";
    if (await canLaunch(whatsURL_android)) {
      await launch(whatsURL_android);
    }
  }
}
