.PHONY: dart
br: 
	@dart run build_runner build -d

.PHONY: flutter
clean:
	@flutter clean && flutter pub get