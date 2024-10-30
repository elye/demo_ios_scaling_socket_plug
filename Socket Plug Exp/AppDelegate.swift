//
//  AppDelegate.swift
//  Socket Plug Exp
//
//  Created by Elisha Lye on 30/10/2024.
//

import UIKit
import TeamA
import TeamB

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        RegisterATeam.registerATeam()
        RegisterBTeam.registerBTeam()
        
        return true
    }
}
