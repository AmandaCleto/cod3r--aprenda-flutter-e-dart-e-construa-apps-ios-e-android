import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    let nativeChannel = FlutterMethodChannel(name: "amanda.com.br/native", binaryMessenger: controller.binaryMessenger)

    nativeChannel.setMethodCallHandler({
      (call: FLutterMethodCall, result: @escaping FlutterResult ) -> Void in

      guard call.method == "calcSum" else {
        result(FlutterMethodNotImplemented)
        return
      }

      if let args = call.arguments as? [String: Any],
         let number1 = args["number1"] as? Int,
         let number2 = args["number2"] as? Int {
           result(number1 + number2)
         } else {
           result(-1)
         }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
