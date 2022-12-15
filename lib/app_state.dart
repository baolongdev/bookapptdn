import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _MarkBook = prefs.getBool('ff_MarkBook') ?? _MarkBook;
  }

  late SharedPreferences prefs;

  bool _Theme = false;
  bool get Theme => _Theme;
  set Theme(bool _value) {
    notifyListeners();

    _Theme = _value;
  }

  bool _MarkBook = false;
  bool get MarkBook => _MarkBook;
  set MarkBook(bool _value) {
    notifyListeners();

    _MarkBook = _value;
    prefs.setBool('ff_MarkBook', _value);
  }

  String _QrCode = '';
  String get QrCode => _QrCode;
  set QrCode(String _value) {
    notifyListeners();

    _QrCode = _value;
  }

  String _avatar = '';
  String get avatar => _avatar;
  set avatar(String _value) {
    notifyListeners();

    _avatar = _value;
  }

  List<bool> _markbook = [];
  List<bool> get markbook => _markbook;
  set markbook(List<bool> _value) {
    notifyListeners();

    _markbook = _value;
  }

  void addToMarkbook(bool _value) {
    notifyListeners();
    _markbook.add(_value);
  }

  void removeFromMarkbook(bool _value) {
    notifyListeners();
    _markbook.remove(_value);
  }

  bool _TimerClick = false;
  bool get TimerClick => _TimerClick;
  set TimerClick(bool _value) {
    notifyListeners();

    _TimerClick = _value;
  }

  int _getTime = 0;
  int get getTime => _getTime;
  set getTime(int _value) {
    notifyListeners();

    _getTime = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
