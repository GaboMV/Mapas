import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mapa"
    compileSdk = flutter.compileSdkVersion
   ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

 defaultConfig {
        applicationId = "com.example.mapa"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

   var mapsKey = ""
        val envFile = File(rootDir, ".env")
        if (envFile.exists()) {
            envFile.forEachLine { line ->
                val parts = line.split("=")
                if (parts.size == 2 && parts[0].trim() == "MAPS_API_KEY") {
                    mapsKey = parts[1].trim()
                }
            }
        }
        manifestPlaceholders["googleMapsKey"] = mapsKey
    }


    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
