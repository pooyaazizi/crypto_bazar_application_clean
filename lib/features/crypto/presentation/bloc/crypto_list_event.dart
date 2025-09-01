abstract class CryptoListEvent {}

class LoadCryptoList extends CryptoListEvent {}

class FilterCryptoList extends CryptoListEvent {
  final String keyword;
  FilterCryptoList(this.keyword);
}
