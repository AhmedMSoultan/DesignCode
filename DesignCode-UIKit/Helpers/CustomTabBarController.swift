//
//  CustomTabBarController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 03/04/2022.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor(named: "TabBarTint")!
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [ .layerMinXMinYCorner ,.layerMaxXMinYCorner]
        
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.top = 5
        self.additionalSafeAreaInsets.bottom = 15
        
    }
    

}
