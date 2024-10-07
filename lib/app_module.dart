import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/datasource/get_all_category.dart';
import 'package:store_app/data/datasource/get_item_details.dart';
import 'package:store_app/data/repositories/get_all_category.dart';
import 'package:store_app/data/repositories/get_item_details.dart';
import 'package:store_app/domain/repositories/get_all_category.dart';
import 'package:store_app/domain/repositories/get_item_details.dart';
import 'package:store_app/domain/usecases/get_all_category.dart';
import 'package:store_app/domain/usecases/get_item_details.dart';
import 'package:store_app/presentation/category/bloc/category_bloc.dart';
import 'package:store_app/presentation/category/category_page.dart';
import 'package:store_app/presentation/details/bloc/item_details_bloc.dart';
import 'package:store_app/presentation/details/details_page.dart';
import 'package:store_app/routes/route_app.dart';

class AppModule extends Module {
  final SharedPreferences sharedPreferences;

  AppModule({required this.sharedPreferences});

  @override
  void binds(i) {
    // Register SharedPreferences
    i.addSingleton<SharedPreferences>(() => sharedPreferences);

    // Bloc
    i.addSingleton<CategoryBloc>(CategoryBloc.new);
    i.addSingleton<ItemDetailsBloc>(ItemDetailsBloc.new);

    // UseCases
    i.add<IGetAllCategoryUseCase>(GetAllCategoryUseCaseImpl.new);
    i.add<IGetITemDetailsUseCase>(GetItemDetailsUseCaseImpl.new);

    // Repositories
    i.add<IGetAllCategoryRepository>(GetAllCategoryRepositoryImpl.new);
    i.add<IGetItemDetailsRepository>(GetItemDetailsRepositoryImpl.new);

    // DataSources
    i.add<IGetAllCategoryDatasource>(GetAllCategoryDatasourceImpl.new);
    i.add<IItemDetailsDatasource>(ItemDetailsDatasourceImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.base,
      child: (context) => const HomePage(),
    );
    r.child(
      AppRoutes.itemDetails,
      child: (context) => const ItemDetailsPage(),
    );
  }
}
