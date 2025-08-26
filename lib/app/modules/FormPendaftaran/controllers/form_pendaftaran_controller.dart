import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/FormPendaftaran/views/result_screen_view.dart';

class FormPendaftaranController extends GetxController {
  // Penyimpanan Data
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  // Validasi
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  // Fungsi validasi
  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'Nama minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender({required String? gender}) {
    if (gender == null || gender.isEmpty) {
      genderError.value = 'Jenis kelamin harus dipilih';
    } else {
      genderError.value = '';
    }
  }

  void validateDateOfBirth({
    required DateTime? dateOfBirth,
    required DateTime date,
  }) {
    if (dateOfBirth == null) {
      dateOfBirthError.value = 'Tanggal lahir harus dipilih';
    } else {
      final now = DateTime.now();
      final age = now.year - dateOfBirth.year;
      if (age < 2) {
        dateOfBirthError.value = 'Tanggal lahir harus lebiih dari 2 tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor telepon tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(gender: gender.value);
    validateDateOfBirth(dateOfBirth: dateOfBirth.value, date: DateTime.now());
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      // Get.snackbar('Sukses', 'Pendaftaran berhasil');
      Get.to(
        () => ResultScreenView(
          name: name.value,
          gender: gender.value,
          dateOfBirth: dateOfBirth.value ?? DateTime.now(),
          phone: phone.value,
        ),
      );
    } else {
      Get.snackbar('Error', 'Periksa kembali data yang diinput');
    }
  }

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
}
