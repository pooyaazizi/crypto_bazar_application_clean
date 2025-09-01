import 'package:crypto_bazar_application_clean/core/theme/app_color.dart';
import 'package:crypto_bazar_application_clean/core/theme/app_text_style.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_bloc.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_event.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() =>
      _CryptoListPageState();
}

class _CryptoListPageState
    extends State<CryptoListPage> {
  @override
  void initState() {
    super.initState();
    context.read<CryptoListBloc>().add(
      LoadCryptoList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            builder: (context, state) {
              if (state is CryptoListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CryptoListLoaded) {
                final List<Crypto> cryptos =
                    state.cryptos;
                return ListView.builder(
                  itemCount: cryptos.length,
                  itemBuilder: (context, index) {
                    final crypto = cryptos[index];
                    return ListTile(
                      title: Text(
                        crypto.name,
                        style: AppTextStyle.heading,
                      ),
                      subtitle: Text(
                        crypto.symbol,
                        style: AppTextStyle.body,
                      ),
                      leading: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            crypto.rank.toString(),
                            style:
                                AppTextStyle.heading,
                          ),
                        ],
                      ),

                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              children: [
                                Text(
                                  crypto.priceUsd
                                      .toStringAsFixed(
                                        2,
                                      ),
                                  style: AppTextStyle
                                      .priceDown,
                                ),

                                Text(
                                  crypto
                                      .changePercent24Hr
                                      .toStringAsFixed(
                                        2,
                                      ),
                                  style: AppTextStyle
                                      .priceDown,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.trending_down),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is CryptoListError) {
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
