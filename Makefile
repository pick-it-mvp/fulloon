ROOT := $(shell git rev-parse --show-toplevel)
FVM := $(ROOT)/.fvm/flutter_sdk/bin/flutter
FLUTTER := $(shell which flutter)
FLUUTER_BIN_DIR := $(shell dirname $(FLUTTER))
FLUTTER_DIR := $(FLUTTER_BIN_DIR:/bin=)


MacM1Cacheclean:
	@echo "╠ Cleaning caches of the app"
	@rm -rf build && rm -rf ios/Pods && rm -rf ios/Podfile.lock && rm -rf .pub-cache/hosted/pub.dartlang.org/ && pod cache clean --all && ${FLUTTER} clean && ${FLUTTER} pub get && cd ios && arch -x86_64 pod repo update && arch -x86_64 pod install
spider:
	@echo "Run Spider"
	@spider build --verbose
	@cd test && rm images_test.dart && rm svgs_test.dart
buildRunner:
	@echo "Run Pub build runner"
	@${FLUTTER} pub run build_runner build --delete-conflicting-outputs
