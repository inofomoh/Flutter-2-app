#workflows:
  flutter-workflow:
    name: Flutter Build Workflow
    max_build_duration: 60
    environment:
      flutter: stable
      xcode: latest
      cocoapods: default
      vars:
        FLUTTER_BUILD_MODE: release
    scripts:
      - name: Install dependencies
        script: |
          flutter pub get
      - name: Build Android APK
        script: |
          flutter build apk --release
      - name: Build iOS IPA
        script: |
          flutter build ios --release --no-codesign
    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk
      - build/ios/ipa/*.ipa Flutter-2-app
