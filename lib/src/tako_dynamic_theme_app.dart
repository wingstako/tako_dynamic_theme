import 'package:flutter/material.dart';
import 'package:tako_dynamic_theme/src/shared_pref_service.dart';

class TakoDynamicTheme extends InheritedWidget {
  final _TakoDynamicThemeWidgetState data;

  const TakoDynamicTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static _TakoDynamicThemeWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TakoDynamicTheme>()!.data;
  }

  @override
  bool updateShouldNotify(TakoDynamicTheme oldWidget) {
    return this != oldWidget;
  }
}

class TakoDynamicThemeWidget extends StatefulWidget {
  const TakoDynamicThemeWidget(
      {Key? key,
      required this.themeMap,
      required this.child,
      required this.fallbackTheme})
      : super(key: key);

  final Map<String, ThemeData>? themeMap;

  final ThemeData fallbackTheme;

  final Widget child;

  @override
  State<TakoDynamicThemeWidget> createState() => _TakoDynamicThemeWidgetState();
}

class _TakoDynamicThemeWidgetState extends State<TakoDynamicThemeWidget> {
  ThemeData? themeData;

  Future? fInit;

  late SharedPrefService _prefs;

  @override
  void initState() {
    super.initState();
    fInit = _loadSharedPrefs();
  }

  Future _loadSharedPrefs() async {
    _prefs = SharedPrefService();
    await _prefs.loadInstance();
    String themeKey = _prefs.getSavedThemeKey();

    if (widget.themeMap!.containsKey(themeKey)) {
      themeData = widget.themeMap![themeKey];
    } else {
      themeData = widget.fallbackTheme;
    }
  }

  void changeTheme({String themeKey = "", bool saveTheme = true}) {
    if (themeKey.isEmpty) return;

    if (saveTheme) {
      _prefs.saveThemeKey(themeKey);
    }

    // do nothing if key not exist
    if (!widget.themeMap!.containsKey(themeKey)) return;

    setState(() {
      themeData = widget.themeMap![themeKey];

      // workaround for active color of Brightness.dark not following colorscheme.secondary
      themeData = themeData!.copyWith(
          toggleableActiveColor:
              widget.themeMap![themeKey]!.colorScheme.secondary);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = themeData ?? ThemeData.dark();
    return FutureBuilder(
      future: fInit,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TakoDynamicTheme(data: this, child: widget.child);
        }

        return Container(
          key: const Key('loading'),
        );
      },
    );
  }
}
