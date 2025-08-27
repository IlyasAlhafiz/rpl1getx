import 'package:get/get.dart';
import 'package:rpl1getx/app/data/Models/alquran.dart';
import 'package:rpl1getx/app/services/alquran_service.dart';

class AlquranController extends GetxController {
  final AlquranService api = Get.put(AlquranService());

  var alqurans = <Alquran>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlquran();
  }

  void fetchAlquran() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchAlquran();

      if (response.statusCode == 200) {
        final data = (response.body as List)
            .map((e) => Alquran.fromJson(e))
            .toList();
        alqurans.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
