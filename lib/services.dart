

import 'package:flutter/services.dart';

class PrinterService {
  static const _channel = MethodChannel("com.example.demom20/printer");


  static Future<String?> printText(String text) async {
    try {
      final result = await _channel.invokeMethod("printText", {"text": text});
      return result;
    } catch (e) {
      return "Print error: $e";
    }
  }


  static Future<bool> isPrinterConnected() async {
    try {
      final result = await _channel.invokeMethod("isPrinterConnected");
      return result == true;
    } catch (e) {
      return false;
    }
  }
}
