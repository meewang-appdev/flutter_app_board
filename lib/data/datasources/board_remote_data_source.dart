import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/board_model.dart';
import '../models/post_model.dart';

abstract class BoardRemoteDataSource {
  Future<List<BoardModel>> getBoards();
  Future<List<PostListItemModel>> getPosts(String slug, int page);
  Future<PostDetailModel> getPostDetail(int id);
  Future<List<PostListItemModel>> searchPosts(String query, String searchTarget, int page);
}

class BoardRemoteDataSourceImpl implements BoardRemoteDataSource {
  final Dio dio;
  final String _tag = 'BoardRemoteDataSourceImpl'; // 클래스 이름을 태그로 사용

  BoardRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PostListItemModel>> searchPosts(String query, String searchTarget, int page) async {
    debugPrint('[$_tag] searchPosts started for query: $query');
    try {
      final response = await dio.get(
        '/boards/search/posts',
        queryParameters: {
          'q': query,
          'search_target': searchTarget,
          'page': page,
        },
      );
      return (response.data as List).map((item) => PostListItemModel.fromJson(item)).toList();
    } on DioException catch (e) {
      // [수정] DioException 발생 시 서버가 보낸 에러 메시지를 포함하여 로그 출력
      debugPrint('[$_tag] searchPosts DioException: ${e.response?.data ?? e.message}');
      throw Exception('게시글 검색에 실패했습니다.');
    } catch (e) {
      debugPrint('[$_tag] searchPosts Exception: $e');
      throw Exception('알 수 없는 오류가 발생했습니다.');
    }
  }

  // --- 다른 API 호출 함수들에도 동일한 디버깅 로직을 적용할 수 있습니다. ---
  @override
  Future<List<BoardModel>> getBoards() async {
    debugPrint('[$_tag] getBoards started');
    try {
      final response = await dio.get('/boards');
      return (response.data as List).map((item) => BoardModel.fromJson(item)).toList();
    } on DioException catch (e) {
      debugPrint('[$_tag] getBoards DioException: ${e.response?.data ?? e.message}');
      throw Exception('게시판 목록을 불러오는데 실패했습니다.');
    }
  }

  @override
  Future<List<PostListItemModel>> getPosts(String slug, int page) async {
    debugPrint('[$_tag] getPosts started for slug: $slug');
    try {
      final response = await dio.get('/boards/$slug/posts', queryParameters: {'page': page});
      return (response.data as List).map((item) => PostListItemModel.fromJson(item)).toList();
    } on DioException catch (e) {
      debugPrint('[$_tag] getPosts DioException: ${e.response?.data ?? e.message}');
      throw Exception('게시글 목록을 불러오는데 실패했습니다.');
    }
  }

  @override
  Future<PostDetailModel> getPostDetail(int id) async {
    debugPrint('[$_tag] getPostDetail started for id: $id');
    try {
      final response = await dio.get('/boards/posts/$id');
      return PostDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('[$_tag] getPostDetail DioException: ${e.response?.data ?? e.message}');
      throw Exception('게시글 상세 정보를 불러오는데 실패했습니다.');
    }
  }
}