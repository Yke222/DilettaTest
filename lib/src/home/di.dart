import '../../core/core.dart';
import 'home.dart';

class HomeInjector extends Injector {
  @override
  Future<void> inject() async {
    i.registerLazySingleton<IHomeDatasource>(
      () => HomeDatasource(
        httpClient: i.get(),
      ),
    );

    i.registerLazySingleton<ILocalDatasource>(
      LocalDatasource.new,
    );

    i.registerLazySingleton<IHomeRepository>(
      () => HomeRepository(
        datasource: i.get(),
        localDatasource: i.get(),
      ),
    );

    i.registerFactory<HomeCubit>(
      () => HomeCubit(
        repository: i.get(),
      ),
    );
  }
}
