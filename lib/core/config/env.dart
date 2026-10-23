class Env {
  static const coingeckoDemoKey = String.fromEnvironment('COINGECKO_DEMO_KEY');
  static const etherscanApiKey = String.fromEnvironment('ETHERSCAN_API_KEY');
  static bool get hasEtherscanKey => etherscanApiKey.isNotEmpty;
}
