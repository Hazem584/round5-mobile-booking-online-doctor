plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mobile_booking_online_doctor"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.mobile_booking_online_doctor"
        minSdk = 21
        targetSdk = 35 // Updated to match compileSdk
        versionCode = 1
        versionName = "1.0"

        // Proguard configuration for release builds
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            isDebuggable = false
            // For production, you should create a proper release keystore
            // signingConfig = signingConfigs.getByName("release")
            signingConfig = signingConfigs.getByName("debug") // Temporary for development
        }
        
        getByName("debug") {
            isDebuggable = true
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-DEBUG"
        }
    }

    // Add signing configurations for release (uncomment when ready for production)
    /*
    signingConfigs {
        create("release") {
            storeFile = file("path/to/your/release.keystore")
            storePassword = "your_store_password"
            keyAlias = "your_key_alias"
            keyPassword = "your_key_password"
        }
    }
    */

    // Optimize build performance
    packaging {
        resources {
            excludes.addAll(
                listOf(
                    "/META-INF/AL2.0",
                    "/META-INF/LGPL2.1",
                    "**/kotlin/**",
                    "kotlin/**",
                    "**/*.kotlin_metadata",
                    "**/*.version",
                    "/kotlin-tooling-metadata.json"
                )
            )
        }
    }

    // Enable BuildConfig
    buildFeatures {
        buildConfig = true
    }

    // Lint options
    lint {
        disable.add("InvalidPackage")
        checkReleaseBuilds = false
        abortOnError = false
    }
}

flutter {
    source = "../.."
}