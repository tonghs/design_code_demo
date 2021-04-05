//
//  ContentView.swift
//  PushNotification
//
//  Created by 仝华帅 on 2021/4/5.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("请求权限") {
                UNUserNotificationCenter.current().requestAuthorization(
                    options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("all set")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            
            Button("调度消息") {
                let content = UNMutableNotificationContent()
                content.title = "通知标题"
                content.subtitle = "通知副标题"
                content.sound = UNNotificationSound.default
                content.badge = 1  // 设置 app 图标显示未读
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger
                )
                
                UNUserNotificationCenter.current().add(request)
            }
            .padding()
            
            Button("check all pending notification") {
                UNUserNotificationCenter.current().getPendingNotificationRequests { notificationReqs in
                    
                    for notiReq: UNNotificationRequest in notificationReqs {
                        print(notiReq.identifier)
                    }
                }
            }
            .padding()
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
        
        
    }
}

// foreground 显示通知
extension AppDelegate: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        UIApplication.shared.applicationIconBadgeNumber = 0
        completionHandler([.banner, .sound])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
