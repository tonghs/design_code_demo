//
//  PushNotificationApp.swift
//  PushNotification
//
//  Created by 仝华帅 on 2021/4/5.
//

import SwiftUI
import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self

        //add code when didFinishLaunchingWithOptions
        return true
    }
}


@main
struct PushNotificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
