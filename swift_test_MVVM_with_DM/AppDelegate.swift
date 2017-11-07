//
//  AppDelegate.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 01/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let controller = UITabBarController()
        
        let v1 = WithoutDataModelViewModel(with: nil)
        let c1 = WithoutDataModelController(viewModel: v1)
        
        let v2 = WithDataModelViewModel(with: nil)
        let c2 = WithDataModelController(viewModel: v2)

        let v3 = RxBindViewModel(with: nil)
        let c3 = RxBindController(viewModel: v3)

        controller.viewControllers = [c1, c2, c3]
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        
        return true
    }
}
