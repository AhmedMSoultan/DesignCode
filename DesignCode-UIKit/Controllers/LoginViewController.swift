//
//  LoginViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 19/04/2022.
//

import UIKit
import Firebase
import Combine

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginCard: CustomView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    enum LoginStatus {
    case signIn
    case signUp
    }
    
    var emailIsEmpty = true
    var passwordIsEmpty = true
    private var tokens : Set<AnyCancellable> = []
    var loginStatus : LoginStatus = .signUp {
        didSet {
            self.titleLabel.text = (loginStatus == .signUp) ? NSLocalizedString("Sign up", comment: "Sign up") : NSLocalizedString("Sign in", comment: "Sign in")
            self.primaryBtn.setTitle((loginStatus == .signUp) ? NSLocalizedString("Create account", comment: "Create account") : NSLocalizedString("Sign in", comment: "Sign in"), for: .normal)
            self.accessoryBtn.setTitle((loginStatus == .signUp) ? NSLocalizedString("Already have an account?", comment: "Already have an account?") : NSLocalizedString("Don't have an account?", comment: "Don't have an account?"), for: .normal)
            self.passwordTextField.textContentType = (loginStatus == .signUp) ? .newPassword : .password
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginCard.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -300)
        }

        emailTextField.publisher(for: \.text).sink { newValue in
            self.emailIsEmpty = (newValue == "" || newValue == nil)
        }.store(in: &tokens)
        
        passwordTextField.publisher(for: \.text).sink { newValue in
            self.passwordIsEmpty = (newValue == "" || newValue == nil)
        }.store(in: &tokens)
        
    }
    
    @IBAction func primaryBtnAction(_ sender: Any) {
        
        if (emailIsEmpty || passwordIsEmpty){
            let alert = UIAlertController(title: NSLocalizedString("Missing information", comment: "Missing information"), message: NSLocalizedString("Please make sure to enter a valid email and password", comment: "Please make sure to enter a valid email and password"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .cancel, handler: nil))
            self.present(alert, animated: true,completion: nil)
        } else {
            if(loginStatus == .signUp){
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    // Segue to the home screen
                    self.goToHomeScreen()
                }
            }else{
                Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    // Segue to the home screen
                    self.goToHomeScreen()
                }
            }
            
        }
        
        
    }
    
    
    @IBAction func accessoryBtnAction(_ sender: Any) {
        self.loginStatus = (self.loginStatus == .signUp) ? .signIn : .signUp
    }
    
    func goToHomeScreen() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
        homeVC.modalTransitionStyle = .coverVertical
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
}
