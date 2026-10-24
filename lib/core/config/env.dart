class Env {
  static const coingeckoDemoKey = String.fromEnvironment('COINGECKO_DEMO_KEY');
  static const etherscanApiKey = String.fromEnvironment('ETHERSCAN_API_KEY');
  static bool get hasEtherscanKey => etherscanApiKey.isNotEmpty;

  static const coingeckoBaseUrl = String.fromEnvironment(
    'COINGECKO_BASE_URL',
    defaultValue: 'https://api.coingecko.com/api/v3',
  );
  static const alternativeBaseUrl = String.fromEnvironment(
    'ALTERNATIVE_BASE_URL',
    defaultValue: 'https://api.alternative.me',
  );
  static const mempoolBaseUrl = String.fromEnvironment(
    'MEMPOOL_BASE_URL',
    defaultValue: 'https://mempool.space/api',
  );
  static const etherscanBaseUrl = String.fromEnvironment(
    'ETHERSCAN_BASE_URL',
    defaultValue: 'https://api.etherscan.io/v2/api',
  );

  static const rssCointelegraphUrl = String.fromEnvironment(
    'RSS_COINTELEGRAPH_URL',
    defaultValue: 'https://cointelegraph.com/rss',
  );
  static const rssCoindeskUrl = String.fromEnvironment(
    'RSS_COINDESK_URL',
    defaultValue:
        'https://www.coindesk.com/arc/outboundfeeds/rss/?outputType=xml',
  );
  static const rssDecryptUrl = String.fromEnvironment(
    'RSS_DECRYPT_URL',
    defaultValue: 'https://decrypt.co/feed',
  );
}
