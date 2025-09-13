package com.example.demom20


import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Import your AAR SDK classes
// Example (adjust to your SDK):
// import com.xsuite.omnidriver.PrinterManager

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.demom20/printer"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {

                // ✅ Test Print
                "printText" -> {
                    val text = call.argument<String>("text") ?: "Hello Printer"
                    try {
                        Log.d("demom20", "Trying to print: $text")

                        // Replace with actual SDK logic:
                        // val printer = PrinterManager()
                        // printer.connect()   // if required
                        // printer.print(text)
                        // printer.disconnect() // if required

                        result.success("Printed: $text ✅")
                    } catch (e: Exception) {
                        Log.e("demom20", "Print failed", e)
                        result.error("PRINT_ERROR", e.message, null)
                    }
                }

                // ✅ Check Printer Connection
                "isPrinterConnected" -> {
                    try {
                        Log.d("demom20", "Checking printer connection...")

                        // Replace with actual SDK check:
                        // val printer = PrinterManager()
                        // val connected = printer.isConnected()
                        val connected = true // <- temporary mock

                        result.success(connected)
                    } catch (e: Exception) {
                        Log.e("demom20", "Connection check failed", e)
                        result.error("CHECK_ERROR", e.message, null)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }
}
