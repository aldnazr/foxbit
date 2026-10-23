class WalletBalance {
  final double coinAmount;
  final double? usd;
  final double? idr;
  const WalletBalance({required this.coinAmount, this.usd, this.idr});
}

class WalletTx {
  final String id;
  final DateTime? time;
  final bool isIn;
  final double amountCoin;
  final bool confirmed;
  const WalletTx({
    required this.id,
    required this.time,
    required this.isIn,
    required this.amountCoin,
    this.confirmed = true,
  });
}

class FiatPrices {
  final double btcUsd;
  final double btcIdr;
  final double ethUsd;
  final double ethIdr;
  const FiatPrices({
    required this.btcUsd,
    required this.btcIdr,
    required this.ethUsd,
    required this.ethIdr,
  });
}
