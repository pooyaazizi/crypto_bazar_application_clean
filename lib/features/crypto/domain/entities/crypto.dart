class Crypto {
  final String id;
  final int rank;
  final String symbol;
  final String name;
  final double supply;
  final double maxSupply;
  final double marketCapUsd;
  final double volumeUsd24Hr;
  final double priceUsd;
  final double changePercent24Hr;
  final String explorer;

  Crypto({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.explorer,
  });
}