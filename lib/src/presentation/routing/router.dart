import 'package:auto_route/auto_route.dart';
import 'package:finack/src/features/expenses/presentation/pages/expenses_page.dart';
import 'package:finack/src/features/overview/presentation/pages/overview_page.dart';
import 'package:finack/src/features/journal/presentation/pages/journal_page.dart';
import 'package:finack/src/features/login/presentation/pages/login_page.dart';
import 'package:finack/src/features/settings/presentation/pages/settings_page.dart';
import 'package:finack/src/presentation/dashboard/dashboard_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/dashboard',
      page: DashboardScreen,
      children: [
        AutoRoute(
          path: 'overview',
          name: 'OverviewRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: OverviewPage, initial: true),
            // AutoRoute(path: ':postId', page: SinglePostPage),
          ],
        ),
        AutoRoute(
          path: 'journal',
          name: 'JournalRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: JournalPage),
            // AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'expenses',
          name: 'ExpensesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ExpensesPage),
            // AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        )
      ],
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    )
  ],
)
class $AppRouter {}
