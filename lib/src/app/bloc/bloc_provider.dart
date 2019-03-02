import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T> provider = context
        .ancestorInheritedElementForWidgetOfExactType(type)
        ?.widget;
    return provider?.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return new _BlocProviderInherited(
      child: widget.child,
      bloc: widget.bloc
    );
  }

  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {

  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}