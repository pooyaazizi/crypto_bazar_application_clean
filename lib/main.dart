import 'package:crypto_bazar_application_clean/core/di/service_locator.dart';
import 'package:crypto_bazar_application_clean/core/theme/app_theme.dart';

import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_bloc.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_event.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/pages/crypto_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  initServiceLocator();

  runApp(
    BlocProvider(
      create: (_) =>
          GetIt.I.get<CryptoListBloc>()
            ..add(LoadCryptoList()),
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
