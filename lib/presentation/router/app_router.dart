import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:flutter_bloc/src/bloc_provider.dart'
    show BlocProviderSingleChildWidget;
import 'package:flutter_mockup_bloc/presentation/router/page_config.dart';

import 'app_pages.dart';
import 'app_route_observer.dart';

enum Transition {
  fadeIn,
  rightToLeft,
  downToUp,
  rightToLeftWithFade,
}

extension _TransitionExtension on Transition {
  Offset? get beginOffset {
    switch (this) {
      case Transition.rightToLeft:
      case Transition.rightToLeftWithFade:
        return const Offset(1.0, 0.0);
      case Transition.downToUp:
        return const Offset(0.0, 1.0);
      default:
        return null;
    }
  }

  Offset? get endOffset {
    if (this == Transition.rightToLeftWithFade) return const Offset(-1.0, 0.0);
  }

  static Widget builder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Transition transition,
    Curve? curve,
    Widget child,
  ) {
    const zeroOffset = Offset.zero;

    if (transition == Transition.fadeIn)
      return FadeTransition(opacity: animation, child: child);

    if (transition == Transition.rightToLeftWithFade) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: transition.beginOffset,
          end: zeroOffset,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: zeroOffset,
              end: transition.endOffset,
            ).animate(secondaryAnimation),
            child: child,
          ),
        ),
      );
    }

    final tween = Tween(begin: transition.beginOffset, end: zeroOffset);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve ?? _defaultTransitionCurve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}

const Transition _defaultTransition = Transition.rightToLeft;
const Curve _defaultTransitionCurve = Curves.easeOutQuad;
const Duration _defaultTransitionDuration = Duration(milliseconds: 320);

Never _routeObserverIsRequired() {
  throw '[RouteObserver] from [AppRouter] has not been initialized';
}

class AppRouter {
  static final String _initialPageName = AppPages.Initial.name;

  static AppRouteObserver? _routeObserver;

  static AppRouteObserver createRouteObserver() =>
      _routeObserver ??= AppRouteObserver();

  static void subscribe(RouteAware routeAware, BuildContext context) {
    if (_routeObserver == null) _routeObserverIsRequired();

    _routeObserver?.subscribe(routeAware, ModalRoute.of(context)!);
  }

  static void unsubscribe<R extends Route<dynamic>>(RouteAware routeAware) {
    if (_routeObserver == null) _routeObserverIsRequired();

    _routeObserver?.unsubscribe(routeAware);
  }

  static String _duplicatedPage(String name) => "Duplicated Page: $name";

  static PageRouteBuilder<T> _createRoute<T>({
    required PageBuilder pageBuilder,
    required RouteSettings settings,
    Transition? transition,
    Duration? transitionDuration,
    Curve? curve,
    bool opaque = true,
    bool fullscreenDialog = false,
  }) =>
      PageRouteBuilder<T>(
        pageBuilder: (_, __, ___) => pageBuilder(),
        settings: settings,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            _TransitionExtension.builder(
          context,
          animation,
          secondaryAnimation,
          transition ?? _defaultTransition,
          curve,
          child,
        ),
        transitionDuration: transitionDuration ?? _defaultTransitionDuration,
        opaque: opaque,
        fullscreenDialog: fullscreenDialog,
      );

  /// [duration]
  /// The duration the transition going forwards.
  ///
  /// [opaque]
  ///
  /// {@macro flutter.widgets.TransitionRoute.opaque}
  ///
  /// [fullscreenDialog]
  ///
  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  static Future<T?> toPage<T extends Object?, B extends BlocBase<Object?>>(
    BuildContext context,
    AppPages page, {
    Map<String, dynamic>? arguments,
    B? blocValue,
    List<BlocProviderSingleChildWidget>? blocProviders,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    bool? opaque,
    bool? fullscreenDialog,
  }) {
    final NavigatorState navState = Navigator.of(context);

    final PageConfig pageConfig =
        AppPagesExtension.getPageConfig(page, arguments);

    if (pageConfig.preventDuplicates &&
        navState.widget.pages.isNotEmpty &&
        navState.widget.pages.last.name == page.name)
      throw StateError(_duplicatedPage(page.name));

    late PageBuilder pageBuilder;

    if (blocValue != null)
      pageBuilder = () => BlocProvider.value(
            value: blocValue,
            child: (() => pageConfig.pageBuilder())(),
          );
    else if (blocProviders != null)
      pageBuilder = () => MultiBlocProvider(
            providers: blocProviders,
            child: (() => pageConfig.pageBuilder())(),
          );
    else
      pageBuilder = pageConfig.pageBuilder;

    return navState.push<T>(
      _createRoute(
        pageBuilder: pageBuilder,
        settings: RouteSettings(name: page.name, arguments: arguments),
        transition: transition ?? pageConfig.transition,
        transitionDuration: duration ?? pageConfig.transitionDuration,
        curve: curve ?? pageConfig.curve,
        opaque: opaque ?? pageConfig.opaque,
        fullscreenDialog: fullscreenDialog ?? pageConfig.fullscreenDialog,
      ),
    );
  }

  /// [duration]
  /// The duration the transition going forwards.
  static Future<T?>? replaceAllWithPage<T>(
    BuildContext context,
    AppPages page, {
    bool Function(Route<dynamic>)? predicate,
    Map<String, dynamic>? arguments,
    Transition? transition,
    Curve? curve,
    Duration? duration,
  }) {
    final PageConfig pageConfig =
        AppPagesExtension.getPageConfig(page, arguments);

    return Navigator.of(context).pushAndRemoveUntil(
      _createRoute(
        pageBuilder: pageConfig.pageBuilder,
        settings: RouteSettings(name: page.name, arguments: arguments),
        transition: transition ?? pageConfig.transition,
        transitionDuration: duration ?? pageConfig.transitionDuration,
        curve: curve ?? pageConfig.curve,
        opaque: pageConfig.opaque,
        fullscreenDialog: pageConfig.fullscreenDialog,
      ),
      predicate ?? (Route<dynamic> _) => false,
    );
  }

  static void back<T>(
    BuildContext context, {
    T? result,
  }) =>
      Navigator.pop(context, result);

  static void backToPageName(BuildContext context, String name) =>
      Navigator.of(context).popUntil((route) {
        if (route is DialogRoute) return false;

        String? routeName;

        if (route is MaterialPageRoute || route is PageRouteBuilder)
          routeName = route.settings.name;

        return routeName == name || routeName == _initialPageName;
      });

  static void backToPage(BuildContext context, AppPages page) =>
      backToPageName(context, page.name);

  /// Trick explained here: https://github.com/flutter/flutter/issues/20451
  /// Note `ModalRoute.of(context).settings.name` doesn't always work.
  static Route? getCurrentNavigatorRoute(BuildContext context) {
    Route? currentRoute;
    Navigator.of(context).popUntil((route) {
      currentRoute = route;
      return true;
    });
    return currentRoute;
  }

  /// Trick explained here: https://github.com/flutter/flutter/issues/20451
  /// Note `ModalRoute.of(context).settings.name` doesn't always work.
  static String? getCurrentNavigatorRouteName(BuildContext context) =>
      getCurrentNavigatorRoute(context)!.settings.name;
}
