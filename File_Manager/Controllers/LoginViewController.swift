//
//  LoginViewController.swift
//  File_Manager
//
//  Created by Слава Орлов on 02.05.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var manager = PasswordManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.setupScreen()
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let password = passwordTextField.text, password != "" else {
            Picker.defaultPicker.showAlert(title: "Error", message: "Please Enter Password", in: self)
            return
        }
        manager.passwordCheckMethod(password: password)
    }
}
