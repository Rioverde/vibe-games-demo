.PHONY: generate watch format analyze test run clean

generate:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

format:
	dart format --line-length 120 lib test

analyze:
	flutter analyze

test:
	flutter test

run:
	flutter run --flavor development --target lib/main_development.dart

clean:
	flutter clean && flutter pub get
