import 'package:get_it/get_it.dart';
import 'package:mlk/Auth/data/datasources/user_remote_data_source.dart';
import 'package:mlk/Auth/data/repositories/user_repoistory_impl.dart';
import 'package:mlk/Auth/domain/repositories/user_repository.dart';
import 'package:mlk/Auth/domain/usecase/log_in_use_case.dart';
import 'package:mlk/Auth/domain/usecase/register_use_case.dart';
import 'package:mlk/Auth/presentation/Auth_cubit/auth_cubit.dart';
import 'package:mlk/products/data/datasources/product_remote_data_source.dart';
import 'package:mlk/products/data/repository/product_repository_impl.dart';
import 'package:mlk/products/domaine/repositories/product_repository.dart';
import 'package:mlk/products/domaine/usecases/add_to_card_usecase.dart';
import 'package:mlk/products/domaine/usecases/get_all_product_usecase.dart';
import 'package:mlk/products/domaine/usecases/get_one_product_use_case.dart';
import 'package:mlk/products/presentation/cubit/product_cubit/product_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(
      () => AuthCubit(registerUseCase: sl(), loginUseCase: sl()));
  sl.registerFactory(() => ProductCubit(
      getAllProductUseCase: sl(),
      getOneProductUseCase: sl(),
      addCartUseCase: sl()));

  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductUseCase(sl()));
  sl.registerLazySingleton(() => GetOneProductUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        userRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        productRemoteDataSourceImpl: sl(),
      ));

  sl.registerLazySingleton(() => UserRemoteDataSourceImpl());
  sl.registerLazySingleton(() => ProductRemoteDataSourceImpl());
}
