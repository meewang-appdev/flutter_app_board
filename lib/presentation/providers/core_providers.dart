import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api_client.dart';

// [중앙화] SharedPreferences의 유일한 Provider 정의
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  // [디버깅] 이 로그가 보인다면, main.dart의 override가 여전히 적용되지 않았다는 의미입니다.
  debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  debugPrint("!!! [CRITICAL ERROR] 원본 sharedPreferencesProvider 접근 !!!");
  debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  throw UnimplementedError('SharedPreferences was not initialized');
});

// [중앙화] Dio의 유일한 Provider 정의
final dioProvider = Provider((ref) => Dio());

// [중앙화] ApiClient의 유일한 Provider 정의
final apiClientProvider = Provider((ref) => ApiClient(ref));