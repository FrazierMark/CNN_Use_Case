//
//  SaveButton.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI
import UserNotifications

struct SaveButton: View {
    var action: () -> Void
    var title:String = "Save For Later"
    var body: some View {
        Button(action: {
            sendNotification(delay: 5.0)
            action()
        }, label: {
            Text(title)
                .font(.headline )
        })
    }
    
    func sendNotification(delay:TimeInterval){
        let UNcenter = UNUserNotificationCenter.current()
        UNcenter.requestAuthorization(options: [.alert,.sound]) { (granted, nil) in
            
            if granted {
                UNcenter.getNotificationSettings { (settings) in
                    let auth = settings.authorizationStatus
                    if auth == .authorized || auth == .provisional{
                        let content = UNMutableNotificationContent()
                        content.body = "Save Article for Later"
                        content.title = "Save Article"
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNcenter.add(request, withCompletionHandler: nil)
                    }
                }
            }else{
                print("Permission not granted")
            }
        }
        
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(action: {})
    }
}


