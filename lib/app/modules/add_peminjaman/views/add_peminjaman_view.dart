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
                      return "Tanggal Tidak Boleh Kosong";
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100)
                    );
                    if (selectedDate != null) {
                      String formattedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                      controller.tanggalpController.text = formattedDate;
                    }
                  },
                ),
                TextFormField(
                  controller: controller.tanggalkController,
                  decoration:
                      InputDecoration(hintText: "Masukkan Tanggal Kembali"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Tanggal Tidak Boleh Kosong";
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100)
                    );
                    if (selectedDate != null) {
                      String formattedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                      controller.tanggalkController.text = formattedDate;
                    }
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
