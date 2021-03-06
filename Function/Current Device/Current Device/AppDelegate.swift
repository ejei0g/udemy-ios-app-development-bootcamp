//
//  AppDelegate.swift
//  Current Device
//
//  Created by Jaeyoung Lee on 2021/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Do any additional setup after loading the view.
        print("### UIDevice.current ###")
        print("name: ", UIDevice.current.name)
        print("systemName: ", UIDevice.current.systemName)
        print("systemVersion: ", UIDevice.current.systemVersion)
        print("model: ", UIDevice.current.model)
        print("localizedModel: ", UIDevice.current.localizedModel)
        print("userInterfaceIdiom ", UIDevice.current.userInterfaceIdiom)
        print("identifierForVendor: ", UIDevice.current.identifierForVendor as Any)
        return true
    }

    // MARK: UISceneSession Lifecycle

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

