# Flutter ProGuard Rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.embedding.engine.FlutterEngine
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-dontwarn io.flutter.embedding.**
