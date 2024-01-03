import 'package:crash_box/pages/dashboard/view.dart';
import 'package:get/get.dart';

import '../pages/home/view.dart';
import '../pages/my/view.dart';
import '../pages/portfolio/view.dart';
import '../pages/portfolio_detail/view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.Portfolio,
      page: () => PortfolioPage(),
    ),
    GetPage(
      name: AppRoutes.PortfolioDetail,
      page: () => PortfolioDetailPage(),
    ),
    GetPage(
      name: AppRoutes.My,
      page: () => MyPage(),
    ),
    GetPage(
      name: AppRoutes.Dashboard,
      page: () => DashboardPage(),
    ),
  ];
}
