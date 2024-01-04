import 'package:my_contact_app/infrastructure/core/config/env_config.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://6594f6b404335332df81b914.mockapi.io/api/v1',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://6594f6b404335332df81b914.mockapi.io/api/v1',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://6594f6b404335332df81b914.mockapi.io/api/v1',
    );
  }
}
