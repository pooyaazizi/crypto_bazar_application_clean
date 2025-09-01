import 'package:crypto_bazar_application_clean/core/theme/app_theme.dart';
import 'package:crypto_bazar_application_clean/features/crypto/data/datasources/crypto_remote_datasource_impl.dart';
import 'package:crypto_bazar_application_clean/features/crypto/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/usecases/get_cryptos.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_bloc.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/pages/crypto_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final remoteDataSource =
      CryptoRemoteDatasourceImpl();
  final repository = CryptoRepositoryImpl(
    remoteDataSource,
  );
  final getCryptos = GetCryptos(repository);

  runApp(
    BlocProvider(
      create: (_) => CryptoListBloc(getCryptos),
      child: const Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: CryptoListPage(),
    );
  }
}
