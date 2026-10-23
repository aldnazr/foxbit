# vault_chain

A crypto market tracking app built with Flutter. Shows live coin prices (IDR), charts, top coins/NFTs, and a local portfolio — powered by the CoinGecko API.

## Preview

<img src="https://raw.githubusercontent.com/aldnazr/vault-chain/refs/heads/main/preview/1.png" width="300" />

## Features

- Market list of top coins with 24h price change (IDR)
- Coin detail page with OHLC chart and coin stats
- Top coins and top NFTs tabs
- Local portfolio tracking
- Trade and wallet tabs
- Local login/register (SharedPreferences)
- Dark/light theme
- Skeleton loading states

## Tech Stack

- Flutter (Dart ^3.9.2)
- [provider](https://pub.dev/packages/provider) — state management
- [hive_ce](https://pub.dev/packages/hive_ce) + [shared_preferences](https://pub.dev/packages/shared_preferences) — local storage
- [fl_chart](https://pub.dev/packages/fl_chart) — charts
- [freezed](https://pub.dev/packages/freezed) + [json_serializable](https://pub.dev/packages/json_serializable) — code generation
- [CoinGecko API](https://docs.coingecko.com/) — market data

## API Keys (optional, tanpa commit)

Beberapa fitur butuh API key gratis (salin `env.example.json` menjadi `env.json`, isi key):

```bash
flutter run --dart-define-from-file=env.json
```

- `COINGECKO_DEMO_KEY`: CoinGecko Demo (disarankan, mengurangi rate limit)
- `ETHERSCAN_API_KEY`: wajib untuk fitur saldo/transaksi alamat ETH (wallet BTC tetap jalan tanpa key)

`env.json` sudah masuk `.gitignore` — jangan commit. Build release juga perlu `--dart-define-from-file=env.json`.

## Getting Started

Prerequisites: [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.x / Dart ^3.9.2.

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generate freezed/json code
flutter run --dart-define-from-file=env.json
```

## Build APK

```bash
flutter build apk --release --dart-define-from-file=env.json
# output: build/app/outputs/flutter-apk/app-release.apk
```

## CI/CD

GitHub Actions workflow (`.github/workflows/build-apk.yml`) builds the release APK:

| Trigger | Result |
| --- | --- |
| Push to `main` / Pull request | Build APK → artifact `app-release-apk` |
| Tag `v*` | Build APK → artifact + attach to GitHub Release |

## Project Structure

```
lib/
├── core/utils/            # colors, formatters, csv parser, constants
├── data/model/            # freezed/json models
├── data/services/api/     # CoinGecko client + endpoints
├── data/services/providers/ # providers (market, detail, portfolio, theme, ...)
├── presentation/pages/    # screens & tabs
└── widgets/               # shared widgets (skeletons, appbar, ...)
```
