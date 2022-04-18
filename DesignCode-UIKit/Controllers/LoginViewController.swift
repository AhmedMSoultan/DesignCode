//
//  LoginViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 19/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginCard: CustomView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -300)
        }

        
        
    }
    
}
