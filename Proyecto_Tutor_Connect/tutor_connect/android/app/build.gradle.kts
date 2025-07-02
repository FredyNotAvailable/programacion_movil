plugins {
    id("com.android.application")                  // ✔️ Necesario
    id("kotlin-android")                           // ✔️ Necesario si usas código Kotlin
    id("dev.flutter.flutter-gradle-plugin")        // ✔️ Obligatorio para Flutter
    id("com.google.gms.google-services")           // ✔️ Firebase
}

android {
    namespace = "com.example.tutor_connect"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // ✔️ Recomendado por Firebase

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.tutor_connect" // ✔️ Package correcto
        minSdk = flutter.minSdkVersion              // Asegúrate que sea ≥ 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// 👇 AÑADIDO: Asegura que el plugin de Google Services se aplique correctamente
apply(plugin = "com.google.gms.google-services")
