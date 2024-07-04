import 'dart:developer';

import 'package:dgmx_app/data/models/post_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.httpClient});

  final Dio httpClient;

  Future<List<PostModel>> getPosts() async {
    try {
      Response<List<dynamic>> response = await httpClient.get('/posts');
      List<PostModel>? posts = response.data?.map(
        (dynamic item) => PostModel.fromJson(item as Map<String, dynamic>)).toList();

      return posts ?? <PostModel>[];

    } on DioException catch(e) {
      log(e.toString());
    }

    return <PostModel>[];
  }
}