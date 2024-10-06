import 'package:diletta_challenge/main.dart' as app;
import 'package:diletta_challenge/src/home/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de integração: Fluxo Completo', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Olá'), findsOneWidget);

    // Seleciona um item
    final starshipItemWidget = find.byType(StarshipItemWidget);
    expect(starshipItemWidget, findsAny);

    await tester.tap(starshipItemWidget.first);
    await tester.pumpAndSettle();

    // Verifica os detalhes e adciona a lista de desejos
    final bottomSheet = find.byType(DetailsItemBottomSheet);
    expect(bottomSheet, findsOne);

    final addToWishlistButton = find.descendant(
      of: bottomSheet,
      matching: find.text('Adicionar a lista de desejos'),
    );
    expect(addToWishlistButton, findsOne);

    await tester.tap(addToWishlistButton);
    await tester.pumpAndSettle();

    // Navega para a tela de wishlist
    final goToWishlistButton = find.byType(IconButton);
    expect(goToWishlistButton, findsOne);

    await tester.tap(goToWishlistButton);
    await tester.pumpAndSettle();

    expect(find.text('Minha WishList'), findsOneWidget);

    // Busca o primeiro item e remove da lista
    final starshipWishlistItemWidget = find.byType(StarshipItemWidget);
    expect(starshipWishlistItemWidget, findsAny);

    final removeFromListButton = find.descendant(
      of: starshipWishlistItemWidget,
      matching: find.text('Remover da lista de desejos'),
    );
    expect(removeFromListButton, findsOne);

    await tester.tap(removeFromListButton);
    await tester.pumpAndSettle();

    //Volta para home
    final appBar = find.byType(AppBar);
    expect(appBar, findsOne);

    final backButton = find.descendant(
      of: appBar,
      matching: find.byType(IconButton),
    );
    expect(backButton, findsOne);

    await tester.tap(backButton);
    await tester.pumpAndSettle();
  });
}
