import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  final FormPendaftaranController controller = Get.put(
    FormPendaftaranController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pendaftaran'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Nama Lengkap
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Jenis Kelamin
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isNotEmpty
                      ? controller.gender.value
                      : null,
                  hint: const Text('Pilih Jenis Kelamin'),
                  items: ['Laki-laki', 'Perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value!;
                    controller.validateGender(gender: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    border: OutlineInputBorder(),
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Tanggal Lahir
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialDate:
                          controller.dateOfBirth.value ?? DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateOfBirth.value = selectedDate;
                      controller.validateDateOfBirth(
                        date: selectedDate,
                        dateOfBirth: selectedDate,
                      );
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController(
                        text: controller.dateOfBirth.value == null
                            ? ''
                            : DateFormat(
                                'dd-MM-yyyy',
                              ).format(controller.dateOfBirth.value!),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.calendar_today),
                        hintText: 'Pilih Tanggal Lahir',
                        errorText: controller.dateOfBirthError.value.isNotEmpty
                            ? controller.dateOfBirthError.value
                            : null,
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Nomor Telepon
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    border: OutlineInputBorder(),
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Tombol Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
