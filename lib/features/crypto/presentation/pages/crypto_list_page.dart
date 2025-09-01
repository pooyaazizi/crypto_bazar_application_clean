import 'dart:ui' as ui;

import 'package:crypto_bazar_application_clean/core/theme/app_color.dart';
import 'package:crypto_bazar_application_clean/core/theme/app_text_style.dart';
import 'package:crypto_bazar_application_clean/features/crypto/domain/entities/crypto.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_bloc.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_event.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/bloc/crypto_list_state.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/widgets/crypto_down_icon.dart';
import 'package:crypto_bazar_application_clean/features/crypto/presentation/widgets/crypto_up_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
      appBar: AppBar(
        title: Text('کریپتو بازار'),

        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Directionality(
                textDirection: ui.TextDirection.rtl,
                child: TextField(
                  onChanged: (value) {
                    context.read<CryptoListBloc>().add(
                      FilterCryptoList(value),
                    );
                  },
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greenColor,
                    hintText:
                        'رمز ارز معتبر خود را جست و جو کنید...',
                    hintStyle: TextStyle(
                      color: AppColors.whiteColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            BlocBuilder<
              CryptoListBloc,
              CryptoListState
            >(
              builder: (context, state) {
                if (state is CryptoListLoaded &&
                    state.isSearchLoadingVisible) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 20.0,
                      left: 10.0,
                    ),
                    child: Text(
                      'در حال جست و جوی رمز ارز...',
                      style: TextStyle(
                        color: AppColors.greenColor,
                      ),
                      textDirection:
                          ui.TextDirection.rtl,
                      textAlign: TextAlign.end,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: RefreshIndicator(
                  backgroundColor:
                      AppColors.greenColor,
                  color: AppColors.whiteColor,
                  onRefresh: () async {
                    context.read<CryptoListBloc>().add(
                      LoadCryptoList(),
                    );
                  },
                  child: BlocBuilder<CryptoListBloc, CryptoListState>(
                    builder: (context, state) {
                      if (state is CryptoListLoading) {
                        return const Center(
                          child:
                              CircularProgressIndicator(
                                backgroundColor:
                                    AppColors
                                        .greenColor,
                                color: AppColors
                                    .whiteColor,
                              ),
                        );
                      } else if (state
                          is CryptoListLoaded) {
                        final List<Crypto> cryptos =
                            state.cryptos;

                        return ListView.builder(
                          itemCount: cryptos.length,
                          itemBuilder: (context, index) {
                            final crypto =
                                cryptos[index];
                            String formattedPriceUsd =
                                NumberFormat.decimalPattern()
                                    .format(
                                      crypto.priceUsd,
                                    );

                            String
                            formattedChangePercent24Hr =
                                NumberFormat.decimalPattern()
                                    .format(
                                      crypto
                                          .changePercent24Hr,
                                    );
                            return ListTile(
                              title: Text(
                                crypto.name,
                                style: AppTextStyle
                                    .heading,
                              ),
                              subtitle: Text(
                                crypto.symbol,
                                style:
                                    AppTextStyle.body,
                              ),
                              leading: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: [
                                  Text(
                                    crypto.rank
                                        .toString(),
                                    style: AppTextStyle
                                        .heading,
                                  ),
                                ],
                              ),

                              trailing: SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                      children: [
                                        Text(
                                          formattedPriceUsd,
                                          style:
                                              crypto.changePercent24Hr >=
                                                  0
                                              ? AppTextStyle
                                                    .priceUp
                                              : AppTextStyle
                                                    .priceDown,
                                        ),

                                        Text(
                                          crypto.changePercent24Hr >=
                                                  0
                                              ? '+${formattedChangePercent24Hr}'
                                              : '${formattedChangePercent24Hr}',
                                          style:
                                              crypto.changePercent24Hr >=
                                                  0
                                              ? AppTextStyle
                                                    .priceUp
                                              : AppTextStyle
                                                    .priceDown,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    crypto.changePercent24Hr >=
                                            0
                                        ? cryptoUpIcon()
                                        : cryptoDownIcon(),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state
                          is CryptoListError) {
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
            ),
          ],
        ),
      ),
    );
  }
}
