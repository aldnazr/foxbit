<img src="https://raw.githubusercontent.com/aldnazr/vault-chain/refs/heads/main/preview/banner.webp" alt="Foxbit Banner" />

# Foxbit

Foxbit is a Flutter-based cryptocurrency market tracking, portfolio management, and wallet monitoring application powered by the CoinGecko, Mempool, and Etherscan APIs.

## Features

- **Market Overview**: Live cryptocurrency prices (IDR), market trends, top coins, gainers, and detailed market stats.
- **Interactive Price Charts**: Detailed coin view with historical charts powered by `fl_chart`.
- **Portfolio Tracking**: Track custom holdings and assets stored locally via Hive CE.
- **Market Insights**: Market news, trends, and overview data.
- **Wallet Monitoring**: On-chain Bitcoin and Ethereum wallet balance tracking using Mempool and Etherscan APIs with address validation.
- **Authentication & Settings**: Local auth management, dark-themed UI, and customizable application settings.

## Tech Stack

- **Framework**: Flutter (Dart SDK `>=3.13.0`)
- **State Management**: Flutter Riverpod (`flutter_riverpod`, `riverpod_generator`)
- **Navigation**: GoRouter with `StatefulShellRoute` & custom transition animations
- **Networking**: Dio & Http
- **Local Storage**: Hive CE & Shared Preferences
- **UI Components**: FL Chart, Skeletonizer, Flutter SVG, custom SF Pro typography
- **Code Generation**: Freezed, JSON Serializable, Riverpod Generator

## Configuration

Copy `env.example.json` to `env.json` and populate required API keys:

```json
{
  "COINGECKO_DEMO_KEY": "your_coingecko_demo_api_key",
  "ETHERSCAN_API_KEY": "your_etherscan_api_key"
}
```

### Environment Variables

- `COINGECKO_DEMO_KEY`: CoinGecko API Key for fetching cryptocurrency market data and charts.
- `ETHERSCAN_API_KEY`: Etherscan API Key for querying Ethereum wallet transactions and balances.

## Setup & Running

1. **Clone repository**:

   ```bash
   git clone https://github.com/aldnazr/vault-chain.git
   cd foxbit
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Generate code (Freezed / Riverpod / JSON Serializable)**:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run application**:
   ```bash
   flutter run --dart-define-from-file=env.json
   ```

## Building for Production

To build an Android APK:

```bash
flutter build apk --release --dart-define-from-file=env.json
```
