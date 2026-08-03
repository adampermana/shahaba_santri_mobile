import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
     GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
     guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "SahabaShare") else {
       return
     }
     let channel = FlutterMethodChannel(
       name: "sahaba/share",
       binaryMessenger: registrar.messenger()
     )

     channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
       switch call.method {
       case "shareImage":
         guard
           let args = call.arguments as? [String: Any],
           let data = args["bytes"] as? FlutterStandardTypedData
         else {
           result(
             FlutterError(
               code: "invalid_bytes",
               message: "Image bytes are required",
               details: nil
             )
           )
           return
         }

         let fileName = args["fileName"] as? String ?? "quran.png"
         let text = args["text"] as? String
         self?.shareImage(data.data, fileName: fileName, text: text)
         result(nil)
       default:
         result(FlutterMethodNotImplemented)
       }
     }
  }

  private func shareImage(_ data: Data, fileName: String, text: String?) {
    let fileUrl = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
    try? data.write(to: fileUrl, options: .atomic)

    var items: [Any] = [fileUrl]
    if let text { items.append(text) }

    let activityViewController = UIActivityViewController(
      activityItems: items,
      applicationActivities: nil
    )

    guard let controller = topViewController() else { return }
    activityViewController.popoverPresentationController?.sourceView = controller.view
    activityViewController.popoverPresentationController?.sourceRect = CGRect(
      x: controller.view.bounds.midX,
      y: controller.view.bounds.midY,
      width: 0,
      height: 0
    )
    controller.present(activityViewController, animated: true)
  }

  private func topViewController() -> UIViewController? {
    let scene = UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .first { $0.activationState == .foregroundActive }
    var controller = scene?.windows.first { $0.isKeyWindow }?.rootViewController

    while let presented = controller?.presentedViewController {
      controller = presented
    }

    return controller
  }
}
