.PHONY: dart
br: 
	@dart run build_runner build -d

.PHONY: flutter
clean:
	@flutter clean && flutter pub get

.PHONY: genhtml
coverage:
	@./genhtml.perl ./coverage/lcov.info -o coverage/html