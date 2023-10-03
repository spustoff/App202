//
//  App202App.swift
//  App202
//
//  Created by IGOR on 25/09/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_kAs29o4JT7tLtTUjsd8s8wwPQjHHzW")
        Amplitude.instance().initializeApiKey("fd00c98591fc0bbb7f44d4ac50a0d591")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App202App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
