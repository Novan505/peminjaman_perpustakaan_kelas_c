import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../../../data/constan/endpoint.dart';
import '../../../data/provider/api_provider.dart';
// import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController useridController = TextEditingController();
  final TextEditingController bookidController = TextEditingController();
  final TextEditingController tanggalpController = TextEditingController();
  final TextEditingController tanggalkController = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  AddPinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data:
            {
              "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
              "book_id": int.parse(Get.parameters['id'].toString()),
              "tanggal_pinjam": tanggalpController.text.toString(),
              "tanggal_kembali": tanggalkController.text.toString()
            }
        );
        if (response.statusCode == 201) {
          Get.offAllNamed(Routes.PEMINJAMAN);
        } else {
          loading(false);
          Get.snackbar("Sorry", "Gagal Meminjam Buku", backgroundColor: Colors.orange);
        }
      }
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
