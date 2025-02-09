import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _gratitude1 = prefs.getString('ff_gratitude1') ?? _gratitude1;
    });
    _safeInit(() {
      _gratitude2 = prefs.getString('ff_gratitude2') ?? _gratitude2;
    });
    _safeInit(() {
      _gratitude3 = prefs.getString('ff_gratitude3') ?? _gratitude3;
    });
    _safeInit(() {
      _gratitude4 = prefs.getString('ff_gratitude4') ?? _gratitude4;
    });
    _safeInit(() {
      _gratitude5 = prefs.getString('ff_gratitude5') ?? _gratitude5;
    });
    _safeInit(() {
      _lastTimeNoteGratitude = prefs.containsKey('ff_lastTimeNoteGratitude')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastTimeNoteGratitude')!)
          : _lastTimeNoteGratitude;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _gratitude1 = '';
  String get gratitude1 => _gratitude1;
  set gratitude1(String value) {
    _gratitude1 = value;
    prefs.setString('ff_gratitude1', value);
  }

  String _gratitude2 = '';
  String get gratitude2 => _gratitude2;
  set gratitude2(String value) {
    _gratitude2 = value;
    prefs.setString('ff_gratitude2', value);
  }

  String _gratitude3 = '';
  String get gratitude3 => _gratitude3;
  set gratitude3(String value) {
    _gratitude3 = value;
    prefs.setString('ff_gratitude3', value);
  }

  String _gratitude4 = '';
  String get gratitude4 => _gratitude4;
  set gratitude4(String value) {
    _gratitude4 = value;
    prefs.setString('ff_gratitude4', value);
  }

  String _gratitude5 = '';
  String get gratitude5 => _gratitude5;
  set gratitude5(String value) {
    _gratitude5 = value;
    prefs.setString('ff_gratitude5', value);
  }

  DateTime? _selecteddate;
  DateTime? get selecteddate => _selecteddate;
  set selecteddate(DateTime? value) {
    _selecteddate = value;
  }

  DateTime? _lastTimeNoteGratitude;
  DateTime? get lastTimeNoteGratitude => _lastTimeNoteGratitude;
  set lastTimeNoteGratitude(DateTime? value) {
    _lastTimeNoteGratitude = value;
    value != null
        ? prefs.setInt('ff_lastTimeNoteGratitude', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastTimeNoteGratitude');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
