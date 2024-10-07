import 'package:hive/hive.dart';

import '../../../features/wishlist/model/data/wishlist_item.dart';

void initHiveAdapters() {
  Hive.registerAdapter(WishlistItemAdapter());
}