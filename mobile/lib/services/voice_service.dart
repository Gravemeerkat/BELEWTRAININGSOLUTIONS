import 'package:flutter_tts/flutter_tts.dart';

class VoiceService {
  static final VoiceService _instance = VoiceService._internal();
  late FlutterTts _flutterTts;
  bool _isInitialized = false;

  factory VoiceService() {
    return _instance;
  }

  VoiceService._internal() {
    _flutterTts = FlutterTts();
    _initializeTts();
  }

  Future<void> _initializeTts() async {
    try {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      _isInitialized = true;
    } catch (e) {
      print("TTS Initialization Error: $e");
    }
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) {
      await _initializeTts();
    }
    try {
      await _flutterTts.speak(text);
    } catch (e) {
      print("TTS Speaking Error: $e");
    }
  }

  Future<void> stop() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      print("TTS Stop Error: $e");
    }
  }

  Future<void> setSpeechRate(double rate) async {
    try {
      await _flutterTts.setSpeechRate(rate);
    } catch (e) {
      print("TTS Speech Rate Error: $e");
    }
  }

  Future<void> dispose() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      print("TTS Dispose Error: $e");
    }
  }
}
