import 'package:dgmx_app/data/models/post_model.dart';
import 'package:dgmx_app/data/services/api_service.dart';

class ApiRepository {
  ApiRepository({required this.apiService});

  final ApiService apiService;

  Future<List<PostModel>> getPosts() {
    return apiService.getPosts();
  }
}