# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Dio / Retrofit
-keepattributes Signature
-keepattributes *Annotation*
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }

# Freezed / JSON
-keep class **.freezed.* { *; }
-keep class **.*FromJson { *; }
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
