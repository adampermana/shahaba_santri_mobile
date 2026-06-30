## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**
-dontwarn io.flutter.**

# Hive CE
-keep class hive_ce.** { *; }
-keep class * extends hive_ce.HiveObject { *; }

# Flutter deferred components use optional Play Core classes.
-dontwarn com.google.android.play.core.**