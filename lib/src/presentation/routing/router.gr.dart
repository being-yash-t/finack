// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i8;

import '../../features/expenses/presentation/pages/expenses_page.dart' as _i7;
import '../../features/journal/presentation/pages/journal_page.dart' as _i6;
import '../../features/login/presentation/pages/login_page.dart' as _i2;
import '../../features/overview/presentation/pages/overview_page.dart' as _i5;
import '../../features/settings/presentation/pages/settings_page.dart' as _i4;
import '../dashboard/dashboard_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    LoginRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    OverviewRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    JournalRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ExpensesRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    OverviewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OverviewPage());
    },
    JournalRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.JournalPage());
    },
    ExpensesRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ExpensesPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashboardRoute.name, path: '/', children: [
          _i3.RouteConfig(OverviewRouter.name,
              path: 'overview',
              parent: DashboardRoute.name,
              children: [
                _i3.RouteConfig(OverviewRoute.name,
                    path: '', parent: OverviewRouter.name)
              ]),
          _i3.RouteConfig(JournalRouter.name,
              path: 'journal',
              parent: DashboardRoute.name,
              children: [
                _i3.RouteConfig(JournalRoute.name,
                    path: '', parent: JournalRouter.name)
              ]),
          _i3.RouteConfig(ExpensesRouter.name,
              path: 'expenses',
              parent: DashboardRoute.name,
              children: [
                _i3.RouteConfig(ExpensesRoute.name,
                    path: '', parent: ExpensesRouter.name)
              ]),
          _i3.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: DashboardRoute.name)
        ]),
        _i3.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i3.PageRouteInfo<void> {
  const DashboardRoute({List<_i3.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '/', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class OverviewRouter extends _i3.PageRouteInfo<void> {
  const OverviewRouter({List<_i3.PageRouteInfo>? children})
      : super(OverviewRouter.name, path: 'overview', initialChildren: children);

  static const String name = 'OverviewRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class JournalRouter extends _i3.PageRouteInfo<void> {
  const JournalRouter({List<_i3.PageRouteInfo>? children})
      : super(JournalRouter.name, path: 'journal', initialChildren: children);

  static const String name = 'JournalRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ExpensesRouter extends _i3.PageRouteInfo<void> {
  const ExpensesRouter({List<_i3.PageRouteInfo>? children})
      : super(ExpensesRouter.name, path: 'expenses', initialChildren: children);

  static const String name = 'ExpensesRouter';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRouter extends _i3.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i5.OverviewPage]
class OverviewRoute extends _i3.PageRouteInfo<void> {
  const OverviewRoute() : super(OverviewRoute.name, path: '');

  static const String name = 'OverviewRoute';
}

/// generated route for
/// [_i6.JournalPage]
class JournalRoute extends _i3.PageRouteInfo<void> {
  const JournalRoute() : super(JournalRoute.name, path: '');

  static const String name = 'JournalRoute';
}

/// generated route for
/// [_i7.ExpensesPage]
class ExpensesRoute extends _i3.PageRouteInfo<void> {
  const ExpensesRoute() : super(ExpensesRoute.name, path: '');

  static const String name = 'ExpensesRoute';
}
