import 'package:demom20/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: Screen());
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future<void> _checkPrinter() async {
    final connected = await PrinterService.isPrinterConnected();
    _showAlert(
      connected ? "Printer is connected  ✅" : "Printer is not connected ❌",
    );
  }

  Future<void> _testPrint() async {
    final result = await PrinterService.printText("Hello");
    _showAlert(result ?? "Unknown print result");
  }

  Future<void> _testPrint2() async {
    final result = await PrinterService.printText("مرحبا");
    _showAlert(result ?? "Unknown print result");
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Printer Status"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Printer Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _checkPrinter,
              child: const Text("Check Printer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _testPrint,
              child: const Text("Test Print"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _testPrint2,
              child: const Text("Test Print2 مرحبا"),
            ),
          ],
        ),
      ),
    );
  }
}
