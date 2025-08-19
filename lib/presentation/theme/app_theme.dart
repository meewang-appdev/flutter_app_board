import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- 색상 팔레트 정의 ---
class AppColors {
  static const Color primary = Color(0xFF3F51B5); // 앱의 주 색상 (Indigo)
  static const Color accent = Color(0xFFFFC107);  // 강조 색상 (Amber)
  static const Color background = Color(0xFFF5F5F5); // 앱 전체 배경색
  static const Color cardBackground = Colors.white; // 카드 배경색
  static const Color textPrimary = Color(0xFF212121); // 기본 텍스트 색상
  static const Color textSecondary = Color(0xFF757575); // 보조 텍스트 색상
}

// --- 앱 테마 정의 ---
class AppTheme {
  static ThemeData getTheme() {
    // Noto Sans KR 폰트 테마를 기본으로 설정합니다.
    final textTheme = GoogleFonts.notoSansKrTextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,

      // 색상 스키마 정의
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        background: AppColors.background,
        surface: AppColors.cardBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),

      // 텍스트 테마 정의
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(color: AppColors.textPrimary),
        displayMedium: textTheme.displayMedium?.copyWith(color: AppColors.textPrimary),
        displaySmall: textTheme.displaySmall?.copyWith(color: AppColors.textPrimary),
        headlineMedium: textTheme.headlineMedium?.copyWith(color: AppColors.textPrimary),
        headlineSmall: textTheme.headlineSmall?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        titleLarge: textTheme.titleLarge?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        bodyLarge: textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
        bodyMedium: textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
      ),

      // 앱 바 테마 정의
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cardBackground,
        foregroundColor: AppColors.textPrimary,
        elevation: 1,
        centerTitle: true,
      ),

      // 카드 테마 정의
      cardTheme: CardThemeData( // [수정] CardTheme -> CardThemeData
        elevation: 2,
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),

      // ListTile 테마 정의
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.primary,
      ),

      // 버튼 테마 정의
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}