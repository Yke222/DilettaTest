.PHONY: dart
br: 
	@dart run build_runner build -d

.PHONY: flutter
clean:
	@flutter clean && flutter pub get

.PHONY: genhtml
coverage:
	@./genhtml.perl ./coverage/lcov.info -o coverage/html

.PHONY: flutter
run-test:
	@flutter test
	
.PHONY: flutter
run-int-test:
	@flutter test integration_test/integration_test.dart --dart-define API_URL=https://swapi.dev/api/