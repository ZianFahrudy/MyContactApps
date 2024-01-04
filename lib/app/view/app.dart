import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/infrastructure/navigation/nav.dart';
import 'package:my_contact_app/infrastructure/navigation/routes.dart';
import 'package:my_contact_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.navigation,
      getPages: Nav.routes,
    );
  }
}
