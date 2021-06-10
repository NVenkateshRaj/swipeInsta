import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnanimation/tarnsition_provider/initial_screen/initial_screen.dart';
import 'package:learnanimation/tarnsition_provider/size_transition/size_transition.dart';

const String initialRoute = "login";

class Routes {
  static const String initial = "/";
  static const String slideAnimation = "slideAnimation";
  static const String fadeAnimation = "fadeAnimation";
  static const String scaleAnimation = "scaleAnimation";
  static const String sizeAnimation = "sizeAnimation";
  static const String rotationAnimation = "rotationAnimation";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.initial:
        return NoTransitionRoute(
          builder: (_) => InitialScreen(),
          settings: RouteSettings(name: settings.name),
        );


      case Routes.slideAnimation:
        return SlideTransitionPageRoute(
          builder: (_) => SizeTransitionAnimation(),
          settings: RouteSettings(name: settings.name),
        );


      case Routes.fadeAnimation:
        return FadeTransitionPageRoute(
          builder: (_) => SizeTransitionAnimation(),
          settings: RouteSettings(name: settings.name),
        );


      case Routes.scaleAnimation:
        return ScaleTransitionPageRoute(
          builder: (_) => SizeTransitionAnimation(),
          settings: RouteSettings(name: settings.name),
        );


      case Routes.sizeAnimation:
        return SizeTransitionPageRoute(
          builder: (_) => SizeTransitionAnimation(),
          settings: RouteSettings(name: settings.name),
        );


      case Routes.rotationAnimation:
        return RotationTransitionPageRoute(
          builder: (_) => SizeTransitionAnimation(),
          settings: RouteSettings(name: settings.name),
        );
        

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

/// NoTransitionRoute
/// Custom route which has no transitions
class NoTransitionRoute<T> extends MaterialPageRoute<T> {
  NoTransitionRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}




/// NoPushTransitionRoute
/// Custom route which has no transition when pushed, but has a pop animation
class NoPushTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPushTransitionRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is popping
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

/// NoPopTransitionRoute
/// Custom route which has no transition when popped, but has a push animation
class NoPopTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPopTransitionRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is pushing
    if (animation.status == AnimationStatus.forward) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

class RouteUtils {
  static RoutePredicate withNameLike(String name) {
    return (Route<dynamic> route) {
      return !route.willHandlePopInternally &&
          route is ModalRoute &&
          route.settings.name != null &&
          route.settings.name.contains(name);
    };
  }
}

class FadeTransitionPageRoute<T> extends PageRoute<T>{

  FadeTransitionPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return _FadeInPageTransition(routeAnimation: animation, child: child);
  }


  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 900);
  
}

class _FadeInPageTransition extends StatelessWidget {
  _FadeInPageTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}



class SlideTransitionPageRoute<T> extends PageRoute<T>{

  SlideTransitionPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return _SlidePageTransition(routeAnimation: animation, child: child);
  }


  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 900);

}

class _SlidePageTransition extends StatelessWidget {
  _SlidePageTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0, 0.0))
          .animate(_opacityAnimation),
      child: child,
    );
  }
}


class ScaleTransitionPageRoute<T> extends PageRoute<T>{

  ScaleTransitionPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return _ScalePageTransition(routeAnimation: animation, child: child);
  }


  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 900);

}

class _ScalePageTransition extends StatelessWidget {
  _ScalePageTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _opacityAnimation,
      child: child,
    );
  }
}

class SizeTransitionPageRoute<T> extends PageRoute<T>{

  SizeTransitionPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return _SizePageTransition(routeAnimation: animation, child: child);
  }


  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 900);

}

class _SizePageTransition extends StatelessWidget {
  _SizePageTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _opacityAnimation,
      child: child,
      axisAlignment: 0.0,
    );
  }
}


class RotationTransitionPageRoute<T> extends PageRoute<T>{

  RotationTransitionPageRoute({
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
                'Route builders must never return null.');
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return _RotationTransition(routeAnimation: animation, child: child);
  }


  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 900);

}

class _RotationTransition extends StatelessWidget {
  _RotationTransition({
    Key key,
    @required
    Animation<double>
    routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
  CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _opacityAnimation,
      child: child,
    );
  }
}