import 'package:diletta_test/features/product/vm/product_details_vm.dart';

import '../../../core/di/setup_locator.dart';

void productInjection() {
  getIt.registerFactory(() => ProductDetailsViewModel(getIt()));
}
