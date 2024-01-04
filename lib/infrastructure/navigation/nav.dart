// ignore_for_file: strict_raw_type

import 'package:get/get.dart';
import 'package:my_contact_app/features/user/presentation/pages/detail_user_page.dart';
import 'package:my_contact_app/features/user/presentation/pages/home_page.dart';
import 'package:my_contact_app/features/user/presentation/pages/search_page.dart';
import 'package:my_contact_app/infrastructure/navigation/main_nav.dart';
import 'package:my_contact_app/infrastructure/navigation/routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.detail,
      page: DetailUserPage.new,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.navigation,
      page: () => const MainNavigation(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchPage(),
      transition: Transition.cupertino,
    ),
  ];
}
