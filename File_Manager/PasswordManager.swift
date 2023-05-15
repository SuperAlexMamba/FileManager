//
//  PasswordManager.swift
//  File_Manager
//
//  Created by Слава Орлов on 02.05.2023.
//

import Foundation
import KeychainSwift

class PasswordManager {
    
    private let keychain = KeychainSwift()
    
    private var checked = false
    
    private var touched = false
    
    private var password: String = ""
    
    private let minLength = 4
    
    var delegate: LoginViewController?
    
    func setupScreen() {
        
        password = keychain.get("firstPassword") ?? ""
        
        checked = UserDefaults.standard.bool(forKey: "checked")
        touched = UserDefaults.standard.bool(forKey: "touched")
        
        if checked == false {
            delegate?.loginButton.setTitle("Create Password", for: .normal)
            UserDefaults.standard.set(true, forKey: "checked")
        }
        else {
            delegate?.loginButton.setTitle("Enter Password", for: .normal)
        }
    }
    
    func passwordCheckMethod(password: String) {
        
        if checked == false {
            setPassword(newPassword: password)
        }
        else {
            checkPassword(password: password)
        }
    }
    
    func checkPassword(password: String) {
        
        if password != self.password {
            print("FALSE")
            Picker.defaultPicker.showAlert(title: "Password Incorrect", message: "Please enter valid password", in: delegate!)
        }
        else {
            delegate?.performSegue(withIdentifier: "Login", sender: self)
            print("TRUE")
        }
    }
    
    func setPassword(newPassword: String) {
        
        if touched == false {
            
            if newPassword.count < 4 {
                Picker.defaultPicker.showAlert(title: "Password Incorrect", message: "Minimum 4 characters", in: delegate!)
                print(checked)
                return
            }
                        
            delegate?.passwordTextField.text = ""
            delegate?.loginButton.setTitle("Repeat Password", for: .normal)
            password = newPassword
            touched = true
            UserDefaults.standard.set(true, forKey: "touched")
            
        }
        else {
            
            if newPassword != password {
                Picker.defaultPicker.showAlert(title: "Password Incorrect", message: "Please enter valid password!", in: delegate!)
            }
            else {
                keychain.set(newPassword, forKey: "firstPassword")
                UserDefaults.standard.set(true, forKey: "checked")
                checked = true
                delegate?.performSegue(withIdentifier: "Login", sender: self )
            }
        }
    }
}
