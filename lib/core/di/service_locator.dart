import 'package:crypto_bazar_application_clean/features/crypto/data/datasources/crypto_remote_datasource_impl.dart';
import 'package:crypto_bazar_application_clean/features/crypto/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/usecases/get_cryptos.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_bloc.dart';
import 'package:get_it/get_it.dart';

void initServiceLocator() {
  //Datasource
  GetIt.I.registerLazySingleton<
    CryptoRemoteDatasourceImpl
  >(() => CryptoRemoteDatasourceImpl());

  // Repository
  GetIt.I.registerLazySingleton<CryptoRepositoryImpl>(
    () => CryptoRepositoryImpl(
      GetIt.I.get<CryptoRemoteDatasourceImpl>(),
    ),
  );

  //UseCase
  GetIt.I.registerLazySingleton<GetCryptos>(
    () => GetCryptos(
      GetIt.I.get<CryptoRepositoryImpl>(),
    ),
  );

  //Bloc
  GetIt.I.registerFactory<CryptoListBloc>(
    () => CryptoListBloc(GetIt.I.get<GetCryptos>()),
  );
}
