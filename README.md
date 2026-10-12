# Alo Delivery

Alo Delivery is a Flutter delivery app with three account types — **client**, **courier (delivery)** and **merchant**. Clients and merchants create delivery orders; couriers browse the available orders and send price offers. It is available in **Arabic (default, RTL) and English**.

## Features

- **Onboarding** — splash, three intro slides and "continue as" (client / courier / merchant)
- **Auth** — sign up per account type (couriers upload ID, vehicle licence and a profile photo) and log in; accounts awaiting activation get a notice
- **Client** — new order (from / to / phone / photo / vehicle type / description) and order tracking
- **Courier** — available orders, order details with a price offer, and reports
- **Merchant** — new order with price, shipping price and auto total, then the order result (couriers' offers / contact us)
- **Contact us** — call or WhatsApp support when no courier is available
- **Localization** — Arabic and English

## Tech stack

| Concern | Package / approach |
|---|---|
| State management | `flutter_bloc` (Cubit) + `equatable` |
| Architecture | MVVM per feature: `service` → `manager` (cubit) → `screens` / `widgets` |
| Networking | `dio` behind a `ServerGate` singleton returning `CustomResponse<T>` |
| Dependency injection | `get_it` |
| Routing | Named routes (`NamedRoutes` + `AppRoutes`) |
| Local storage | `shared_preferences` via `CacheHelper` (signed-in user in `UserModel`) |
| Localization | `easy_localization` with generated `LocaleKeys` |
| Responsive sizes | `flutter_screenutil` |
| Assets | `flutter_gen` (+ `flutter_svg`, `lottie`) |
| Toasts | `flash` |
| Other | `image_picker`, `url_launcher`, `carousel_slider`, `google_fonts` (Montserrat) |

## Project structure

```
lib/
  core/
    blocs/          # safe Cubit + app-wide vehicles cubit
    extensions/     # context, widget and string extensions (unified_extensions.dart barrel)
    resources/      # API endpoints, constants, sizes, font sizes, shadows
    services/       # ServerGate (Dio), service locator, cache, bloc observer
    shared/         # enums (UserType), models, routes and reusable widgets
    utils/          # theme, colors, logger, image picker, url opener
  features/
    intro/          # splash, onboarding, welcome
    auth/           # login, register (client / courier / merchant)
    home/           # services per account type
    client/         # make order, follow order, order result
    delivery/       # available orders, order details (price offer), reports
    merchant/       # make order, order result
  gen/              # generated files — don't edit by hand
  main.dart
assets/
  images/  lottie_files/  translations/ (ar.json, en.json)
```

Each feature follows the same layout:

```
features/<feature>/
  data/models/   manager/ (cubit + state)   screens/   service/   widgets/
```

Features with several screens keep one sub-folder per screen under `screens/`, sharing the feature's `service/`, `data/models/` and `widgets/`.

## Getting started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart
flutter run
```

For iOS, run `cd ios && pod install && cd ..` after `pub get`.

Before committing:

```bash
flutter analyze
```

Build a release APK:

```bash
flutter build apk --split-per-abi
```

## API

The app uses the Alo Delivery REST API. The base URL and every endpoint are in `lib/core/resources/api_constants.dart`.

## Adding text

1. Add the key to **both** `assets/translations/ar.json` and `en.json`.
2. Regenerate the keys (command above).
3. Use it as `LocaleKeys.<key>.tr()`.

## Git

All work happens directly on `main` — no feature branches. Commits and pushes are done by the author.

## Author

**Muath Sharawy** — Flutter developer

- Email: muath0sharawy@gmail.com
- LinkedIn: [linkedin.com/in/muathsharawy99](https://linkedin.com/in/muathsharawy99)
- GitHub: [github.com/muathsharawy99](https://github.com/muathsharawy99)
- Portfolio: [muathsharawy.web.app](https://muathsharawy.web.app)
