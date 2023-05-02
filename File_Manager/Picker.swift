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
    
    lazy var imagePicker: UIImagePickerController = {
        var picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        
        return picker
    }()
    
    func showImagePicker(in vc: UIViewController) {
        vc.present(imagePicker, animated: true)
    }
    
}
