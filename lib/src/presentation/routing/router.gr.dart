// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i9;

import '../../features/expenses/presentation/pages/expenses_page.dart' as _i8;
import '../../features/journal/presentation/pages/journal_page.dart' as _i7;
import '../../features/login/presentation/pages/login_page.dart' as _i2;
import '../../features/overview/presentation/pages/overview_page.dart' as _i6;
import '../../features/phone_verification/presentation/pages/phone_verification_screen.dart'
    as _i3;
import '../../features/settings/presentation/pages/settings_page.dart' as _i5;
import '../dashboard/dashboard_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardScreen());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    PhoneVerificationScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PhoneVerificationScreen());
    },
    OverviewRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    JournalRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ExpensesRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    },
    OverviewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.OverviewPage());
    },
    JournalRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.JournalPage());
    },
    ExpensesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ExpensesPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(DashboardScreen.name, path: '/dashboard', children: [
          _i4.RouteConfig(OverviewRouter.name,
              path: 'overview',
              parent: DashboardScreen.name,
              children: [
                _i4.RouteConfig(OverviewRoute.name,
                    path: '', parent: OverviewRouter.name)
              ]),
          _i4.RouteConfig(JournalRouter.name,
              path: 'journal',
              parent: DashboardScreen.name,
              children: [
                _i4.RouteConfig(JournalRoute.name,
                    path: '', parent: JournalRouter.name)
              ]),
          _i4.RouteConfig(ExpensesRouter.name,
              path: 'expenses',
              parent: DashboardScreen.name,
              children: [
                _i4.RouteConfig(ExpensesRoute.name,
                    path: '', parent: ExpensesRouter.name)
              ]),
          _i4.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: DashboardScreen.name)
        ]),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig(PhoneVerificationScreen.name,
            path: '/phoneVerification')
      ];
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardScreen extends _i4.PageRouteInfo<void> {
  const DashboardScreen({List<_i4.PageRouteInfo>? children})
      : super(DashboardScreen.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.PhoneVerificationScreen]
class PhoneVerificationScreen extends _i4.PageRouteInfo<void> {
  const PhoneVerificationScreen()
      : super(PhoneVerificationScreen.name, path: '/phoneVerification');

  static const String name = 'PhoneVerificationScreen';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class OverviewRouter extends _i4.PageRouteInfo<void> {
  const OverviewRouter({List<_i4.PageRouteInfo>? children})
      : super(OverviewRouter.name, path: 'overview', initialChildren: children);

  static const String name = 'OverviewRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class JournalRouter extends _i4.PageRouteInfo<void> {
  const JournalRouter({List<_i4.PageRouteInfo>? children})
      : super(JournalRouter.name, path: 'journal', initialChildren: children);

  static const String name = 'JournalRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ExpensesRouter extends _i4.PageRouteInfo<void> {
  const ExpensesRouter({List<_i4.PageRouteInfo>? children})
      : super(ExpensesRouter.name, path: 'expenses', initialChildren: children);

  static const String name = 'ExpensesRouter';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRouter extends _i4.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i6.OverviewPage]
class OverviewRoute extends _i4.PageRouteInfo<void> {
  const OverviewRoute() : super(OverviewRoute.name, path: '');

  static const String name = 'OverviewRoute';
}

/// generated route for
/// [_i7.JournalPage]
class JournalRoute extends _i4.PageRouteInfo<void> {
  const JournalRoute() : super(JournalRoute.name, path: '');

  static const String name = 'JournalRoute';
}

/// generated route for
/// [_i8.ExpensesPage]
class ExpensesRoute extends _i4.PageRouteInfo<void> {
  const ExpensesRoute() : super(ExpensesRoute.name, path: '');

  static const String name = 'ExpensesRoute';
}
