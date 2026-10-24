enum Chain { btc, eth }

extension ChainX on Chain {
  String get code => this == Chain.btc ? 'btc' : 'eth';
  static Chain fromCode(String? code) {
    if (code == 'eth') return Chain.eth;
    return Chain.btc;
  }

  String get label => this == Chain.btc ? 'BTC' : 'ETH';
}

class WatchedWallet {
  final String id;
  final String label;
  final Chain chain;
  final String address;
  final DateTime addedAt;

  const WatchedWallet({
    required this.id,
    required this.label,
    required this.chain,
    required this.address,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'chain': chain.code,
    'address': address,
    'addedAt': addedAt.toIso8601String(),
  };

  factory WatchedWallet.fromJson(Map<String, dynamic> json) {
    return WatchedWallet(
      id:
          json['id']?.toString() ??
          DateTime.now().microsecondsSinceEpoch.toString(),
      label: json['label']?.toString() ?? '',
      chain: ChainX.fromCode(json['chain']?.toString()),
      address: json['address']?.toString() ?? '',
      addedAt:
          DateTime.tryParse(json['addedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }
}
