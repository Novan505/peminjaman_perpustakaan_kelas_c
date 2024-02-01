import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${Get.parameters['judul']}'),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.tanggalpController,
                  decoration:
                      InputDecoration(hintText: "Masukkan Tanggal Pinjam"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tanggalkController,
                  decoration:
                      InputDecoration(hintText: "Masukkan Tanggal Kembali"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return;
                    }
                    return null;
                  },
                ),
                Obx(
                  () => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.AddPinjam();
                          },
                          child: Text("Pinjam"),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
