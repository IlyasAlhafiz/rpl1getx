import 'package:get/get.dart';
import 'package:rpl1getx/app/data/Models/post.dart';
import 'package:rpl1getx/app/services/post_service.dart';

class PostController extends GetxController {
  final PostService api = Get.put<PostService>(PostService());

  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchPosts();

      if (response.statusCode == 200) {
        final data = (response.body as List)
            .map((e) => Post.fromJson(e))
            .toList();
        posts.assignAll(data);
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
