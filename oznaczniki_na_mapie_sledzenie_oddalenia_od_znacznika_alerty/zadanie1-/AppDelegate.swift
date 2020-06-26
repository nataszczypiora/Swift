//
//  AppDelegate.swift
//  zadanie1-
//
//  Created by Iga Łukiewska on 19/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//
import UIKit
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate
{
    var window: UIWindow?
    var cl: CLLocationManager?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        cl = CLLocationManager()
        cl?.delegate = self
        return true
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("exit")
        
        let alert = UIAlertController(title: "o ja jego", message: "masz samochod za daleko", preferredStyle: .alert)
        
        window?.rootViewController?.present(alert, animated: true, completion: {})
        
        var notif = UNMutableNotificationContent()
        notif.subtitle = "Masz samochod za daleko"
        notif.title = "O ja jego!"
        notif.sound = UNNotificationSound.default
        
        var nt = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        let req = UNNotificationRequest(identifier: "o ja jego", content: notif, trigger: nt)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    // MARKletISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

