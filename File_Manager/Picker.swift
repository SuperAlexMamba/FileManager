//
//  Picker.swift
//  File_Manager
//
//  Created by Слава Орлов on 02.05.2023.
//

import Foundation
import UIKit

class Picker {
    
    static let defaultPicker = Picker()
    
    enum message: String {
        case empty = "Password is empty"
        case incorrect = "Please enter valid password"
        case minLengh = "Minimum 4 characters"
    }
    
    var imagePicker: UIImagePickerController = {
        var picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        return picker
    }()
    
    func showImagePicker(in vc: UIViewController) {
        vc.present(imagePicker, animated: true)
    }
    
    func showAlert(title: String, message: String, in viewController: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
        
        viewController.present(alert, animated: true)
    }
}
